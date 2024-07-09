require 'json'
require 'date'

#　実車率の計算

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

# "READY" 準備, "STAND_BY"　待機, "PULL_OUT_PARK"　出庫,  "LOCAL"　地場, "REST"　休憩, "NO_BAGGAGE"　回送, "LOCAL"　地場, "REST"　休憩, "NO_BAGGAGE"　回送, "LOCAL"　地場, "PULL_IN_PARK"　帰庫, "STAND_BY　待機", "INSPECTION　点検"

class Operation
  attr_reader :operation_type, :total_duration_minutes

  def initialize(operation_type, begin_date, end_date)
    @operation_type = operation_type
    @total_duration_minutes = ((DateTime.parse(end_date) - DateTime.parse(begin_date)) * 24 * 60).to_i
  end
end


# 実車率
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
    op['operationEndDeate']
  )
end

# TourCalculatorの作成と計算（tour_rate_unitを分単位で指定）
calculator = TourCalculator.new(operations, 12 * 60)  # 12時間を分に変換
result = calculator.tour_actual_operating_ratio

# 結果の表示
puts "実車率: #{result}"


# このコードは実車率（tour_actual_operating_ratio）を計算しています。実車率の計算を詳しく説明しましょう。
# 実車率の計算式は以下のようになっています：
# 実車率 = 分子 / 分母
# ここで、
# 分子 = RELEVANT_OPERATION_TYPESに含まれる操作の合計時間（分）
# 分母 = tour_rate_unit_minutes * 稼働日数
# それぞれの意味を詳しく見ていきましょう：

# 分子の計算:

# RELEVANT_OPERATION_TYPES = ['LOCAL', 'MAIN_LINE', 'MIDDLE_LINE', 'REST']
# これらの操作タイプに該当する全ての操作の合計時間（分）を計算します。
# この時間は、実際に車両が稼働している時間と休憩時間の合計を表します。


# 分母の計算:

# tour_rate_unit_minutes: 1日の基準となる稼働時間（分）。この例では12時間（720分）に設定されています。
# 稼働日数の計算:

# 全操作の合計時間（分）をtour_rate_unit_minutesで割って切り上げます。
# ただし、最小値は1日とします。


# 分母 = tour_rate_unit_minutes * 稼働日数
# これは、理論上の最大稼働時間を表します。


# 実車率の計算:

# 分子 / 分母の結果を小数点第3位で四捨五入します。



# この計算方法の特徴：

# 実際の稼働時間（RELEVANT_OPERATION_TYPESに含まれる操作の時間）を、理論上の最大稼働時間で割ることで、車両の効率的な利用度を測定しています。
# 稼働日数を考慮することで、長期間の運用や短期間の集中的な運用など、様々な運用パターンに対応できます。
# RELEVANT_OPERATION_TYPESに'REST'（休憩）を含めることで、必要な休憩時間も稼働時間としてカウントしています。これは、ドライバーの労働時間管理の観点から重要です。
# 結果が0から1の間の値となり、車両の利用効率を直感的に理解しやすい形で表現しています。

# この計算方法により、車両の実際の稼働状況を適切に評価し、効率的な運用を行うための指標として活用できます。
