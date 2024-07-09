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

# はい、この稼働率（tour_operating_ratios）の計算について詳しく説明しましょう。
# 稼働率の計算式は以下のようになっています：
# 稼働率 = 分子 / 分母
# ここで、
# 分子 = EXCLUDED_OPERATION_TYPESに含まれない操作の合計時間（分）
# 分母 = tour_rate_unit_minutes * 稼働日数
# それぞれの意味を詳しく見ていきましょう：

# 分子の計算:

# EXCLUDED_OPERATION_TYPES = ['INSPECTION', 'READY', 'STAND_BY', 'EMPTY_CAR', 'LONG_REST']
# これらの操作タイプを除外した全ての操作の合計時間（分）を計算します。
# この時間は、車両が実際に稼働している時間を表します。点検、準備、待機、空車、長時間の休憩を除外することで、より実質的な稼働時間を計算しています。


# 分母の計算:

# tour_rate_unit_minutes: 1日の基準となる稼働時間（分）。この例では12時間（720分）に設定されています。
# 稼働日数の計算:

# 全操作の合計時間（分）をtour_rate_unit_minutesで割って切り上げます。
# ただし、最小値は1日とします。


# 分母 = tour_rate_unit_minutes * 稼働日数
# これは、理論上の最大稼働時間を表します。


# 稼働率の計算:

# 分子 / 分母の結果を小数点第3位で四捨五入します。



# この計算方法の特徴：

# 実際の稼働時間（EXCLUDED_OPERATION_TYPESに含まれない操作の時間）を、理論上の最大稼働時間で割ることで、車両の全体的な稼働効率を測定しています。
# EXCLUDED_OPERATION_TYPESを使用することで、実質的な稼働とみなさない時間（点検、準備、待機など）を除外しています。これにより、より正確な稼働率を算出できます。
# 稼働日数を考慮することで、長期間の運用や短期間の集中的な運用など、様々な運用パターンに対応できます。
# 結果が0から1の間の値となり、車両の全体的な稼働効率を直感的に理解しやすい形で表現しています。
# この稼働率は、実車率よりも広い範囲の活動を含んでいます。例えば、回送（NO_BAGGAGE）や出庫・帰庫（PULL_OUT_PARK, PULL_IN_PARK）なども稼働時間としてカウントされます。

# 注意点：
# コメントにある通り、この計算方法では稼働率が実車率より高くなる可能性があります。これは、稼働率が車両の全体的な使用状況を示すのに対し、実車率がより狭義の「実際に荷物を運んでいる時間」に焦点を当てているためです。
# この計算方法により、車両の全体的な稼働状況を評価し、運用効率を向上させるための指標として活用できます。ただし、実車率と併せて解釈することで、より詳細な運用分析が可能になります。
