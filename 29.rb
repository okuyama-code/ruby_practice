arrs = ["Taiwan-tokyo", "Taiwan-osaka", "Taiwan-kyoto"]

new_arr = arrs.map do |arr|
  arr.gsub(/Taiwan/, "Japan")
end

p new_arr