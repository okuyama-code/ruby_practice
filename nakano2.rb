require 'json'
require 'date'

# 稼働率の計算

# 現在のjsonに対応した値
# 実車率: 0.361 稼働率: 0.594

# 運行区分
# - NONE ()
# - READY (準備)
# - MAIN_LINE (幹線)
# - LOCAL (地場)
# - NO_BAGGAGE (回送)
# - PULL_OUT_PARK (出庫)
# - PULL_IN_PARK (帰庫)
# - REST (休憩)
# - UNLOADING (荷下ろし)
# - LONG_REST (休息)
# - INSPECTION (点検)
# - STAND_BY (待機)
# - PULL_OUT_PARK_FW (回送(出庫))
# - PULL_IN_PARK_FW (回送(帰庫))
# - EMPTY_CAR (空き車両)

class Operation
  attr_reader :tour_id, :operation_type, :total_duration_minutes

  def initialize(operation_type, begin_date, end_date)
    @operation_type = operation_type
    @total_duration_minutes = ((DateTime.parse(end_date) - DateTime.parse(begin_date)) * 24 * 60).to_i
  end
end

# "READY" 準備, "STAND_BY"　待機, "PULL_OUT_PARK"　出庫,  "LOCAL"　地場, "REST"　休憩, "NO_BAGGAGE"　回送, "LOCAL"　地場, "REST"　休憩, "NO_BAGGAGE"　回送, "LOCAL"　地場, "PULL_IN_PARK"　帰庫, "STAND_BY　待機", "INSPECTION　点検"


class TourCalculator
  EXCLUDED_OPERATION_TYPES =
  # [点検、準備、待機、空き車両、長い休憩]
  # EMPTY_CAR?? NO_BAGGAGE
  ['INSPECTION', 'READY', 'STAND_BY', 'EMPTY_CAR', 'LONG_REST']

  #TODO これ実車率より分子が多くならないか？？ そうなると　実車率 < 稼働率　になる？
  # 稼働率の該当operationType
  # NONE （未設定）
  # LOCAL （地場）
  # MAIN_LINE （幹線）
  # REST （休憩）
  # NO_BAGGAGE （回送）
  # PULL_OUT_PARK （出庫）
  # PULL_IN_PARK （帰庫）
  # UNLOADING （荷下ろし）
  # PULL_OUT_PARK_FW （回送(出庫)）
  # PULL_IN_PARK_FW （回送(帰庫)）

  # 実車率
  # 地場（LOCAL）
  # 幹線（MAIN_LINE）
  # 休憩（REST）
  # 中距離路線（MIDDLE_LINE）



  def initialize(operations, tour_rate_unit_minutes)
    @operations = operations
    @tour_rate_unit_minutes = tour_rate_unit_minutes
  end

  def tour_operating_ratios
    return {} if @operations.empty?

    total_duration_minutes = @operations.sum(&:total_duration_minutes)
    duration_minutes = @operations
      .reject { |op| EXCLUDED_OPERATION_TYPES.include?(op.operation_type) }
      .sum(&:total_duration_minutes)

    op_days = [(total_duration_minutes.to_f / @tour_rate_unit_minutes).ceil, 1].max
    (duration_minutes.to_f / (@tour_rate_unit_minutes * op_days)).round(3)
  end
end

# JSONファイルの読み込み
json_file_path = 'tour_operations.json'
begin
  json_data = JSON.parse(File.read(json_file_path))
rescue Errno::ENOENT
  puts "Error: File '#{json_file_path}' not found."
  exit
rescue JSON::ParserError
  puts "Error: Invalid JSON in file '#{json_file_path}'."
  exit
end

tour_operations = json_data['data']['tourOperations']

# Operationオブジェクトの作成
operations = tour_operations.map do |op|
  Operation.new(
    op['operationType'],
    op['operationBeginDate'],
    op['operationEndDeate']
  )
end

# TourCalculatorの作成と計算（tour_rate_unitを時間単位で指定）
calculator = TourCalculator.new(operations, 12 * 60)  # 12時間を指定

result = calculator.tour_operating_ratios

puts "稼働率: #{result}"
