require 'json'
require 'date'

class Operation
  attr_reader :tour_id, :operation_type, :total_duration_minutes

  def initialize(operation_type, begin_date, end_date)
    @operation_type = operation_type
    @total_duration_minutes = ((DateTime.parse(end_date) - DateTime.parse(begin_date)) * 24 * 60).to_i
  end
end

class TourCalculator
  EXCLUDED_OPERATION_TYPES = ['INSPECTION', 'READY', 'STAND_BY', 'EMPTY_CAR', 'LONG_REST']

  def initialize(operations, tour_rate_unit_minutes)
    @operations = operations
    @tour_rate_unit_minutes = tour_rate_unit_minutes
  end

  def tour_operating_ratios
    return {} if @operations.empty?

    ratios = {}
    @operations.group_by(&:tour_id).each do |tour_id, tour_operations|
      total_duration_minutes = tour_operations.sum(&:total_duration_minutes)
      duration_minutes = tour_operations
        .reject { |op| EXCLUDED_OPERATION_TYPES.include?(op.operation_type) }
        .sum(&:total_duration_minutes)

      if total_duration_minutes > 0
        op_days = [((total_duration_minutes.to_f / 60 / 60) / (@tour_rate_unit_minutes / 60)).ceil, 1].max
        ratios[tour_id] = (duration_minutes.to_f / (@tour_rate_unit_minutes * op_days) * 100).round(3)
      else
        puts "Warning: Total duration for tour #{tour_id} is 0 or negative"
        ratios[tour_id] = 0
      end
    end

    ratios
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
