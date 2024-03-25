# fruits = [:apple, :apple, :orange, :mango, :mango, :mango, :mango]

# h = {}
# fruits.each do |fruit|
#   puts fruit
#   h[fruit] ||= 0
#   h[fruit] += 1
# end

# puts h

# fruitsという配列を定義
fruits = [:apple, :apple, :orange, :mango, :mango, :mango, :mango]

# Hash.new(0)は、キーが存在しない場合に自動的に0を設定するハッシュを作成する
# injectメソッドを使って、fruitsの各要素に対する処理を行う
val = fruits.inject(Hash.new(0)) { |hash, key|
 # hashのkeyに対応する値を1増やす
 hash[key] += 1
 # 処理後のハッシュを返す
 hash
}

# valの内容を出力
p val
