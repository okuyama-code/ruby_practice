require 'json'
require 'date'

#　稼働率の計算

# "READY" 準備, "STAND_BY"　待機, "PULL_OUT_PARK"　出庫,  "LOCAL"　地場, "REST"　休憩, "NO_BAGGAGE"　回送, "LOCAL"　地場, "REST"　休憩, "NO_BAGGAGE"　回送, "LOCAL"　地場, "PULL_IN_PARK"　帰庫, "STAND_BY　待機", "INSPECTION　点検"

class Operation
  attr_reader :operation_type, :total_duration_minutes

  def initialize(operation_type, begin_date, end_date)
    @operation_type = operation_type
    @total_duration_minutes = ((DateTime.parse(end_date) - DateTime.parse(begin_date)) * 24 * 60).to_i
  end
end

class TourCalculator
  RELEVANT_OPERATION_TYPES = ['LOCAL', 'MAIN_LINE', 'MIDDLE_LINE', 'REST']

  def initialize(operations, tour_rate_unit_minutes)
    @operations = operations
    @tour_rate_unit_minutes = tour_rate_unit_minutes
  end

  def tour_actual_operating_ratio
    return 0 if @operations.empty?

    total_duration_minutes = @operations.sum(&:total_duration_minutes)
    duration_minutes = @operations
      .select { |op| RELEVANT_OPERATION_TYPES.include?(op.operation_type) }
      .sum(&:total_duration_minutes)

    op_days = [(total_duration_minutes.to_f / @tour_rate_unit_minutes).ceil, 1].max
    (duration_minutes.to_f / (@tour_rate_unit_minutes * op_days)).round(3)
  end
end

# JSONファイルの読み込み
json_file_path = 'tour_operations.json'
json_data = JSON.parse(File.read(json_file_path))

tour_operations = json_data['data']['tourOperations']

# Operationオブジェクトの作成
operations = tour_operations.map do |op|
  Operation.new(
    op['operationType'],
    op['operationBeginDate'],
    op['operationEndDeate']  # タイポに注意: 'operationEndDeate'
  )
end

# TourCalculatorの作成と計算（tour_rate_unitを分単位で指定）
calculator = TourCalculator.new(operations, 12 * 60)  # 12時間を分に変換
result = calculator.tour_actual_operating_ratio

# 結果の表示
puts "実車率: #{result}"

# 詳細情報の表示
total_duration_minutes = operations.sum(&:total_duration_minutes)
relevant_duration_minutes = operations
  .select { |op| TourCalculator::RELEVANT_OPERATION_TYPES.include?(op.operation_type) }
  .sum(&:total_duration_minutes)

# 運行タイプごとの集計
operation_type_summary = operations.group_by(&:operation_type).transform_values do |ops|
  ops.sum(&:total_duration_minutes)
end

puts "\nOperation Type Summary:"
operation_type_summary.each do |type, duration|
  puts "#{type}: #{duration} minutes"
end
