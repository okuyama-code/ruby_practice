# 問題2: URLパラメータのパース
# 与えられたURL文字列からクエリパラメータを抽出し、ハッシュに変換してください。

# ヒント:
# - require 'uri' を使う
# - String#split: 文字列を特定の区切り文字で分割
# - Array#map: 配列の各要素に対して処理を行い、新しい配列を作成
# - Hash[]: 2次元配列からハッシュを作成
# - URI.decode_www_form_component: URLエンコードされた文字列をデコード


require 'uri'

def parse_query_params(url)
  query_string = URI(url).query

  return {} if query_string.nil? || query_string.empty?
  
  params = URI.decode_www_form(query_string)
  Hash[params]
end

url = "https://example.com/search?q=ruby&lang=ja&page=1"
p parse_query_params(url)

# 期待される出力:
# {"q"=>"ruby", "lang"=>"ja", "page"=>"1"}
