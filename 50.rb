require 'date'

today = Date.today.strftime('%F')
yesterday = (Date.today - 1).strftime('%F')
tomorrow = (Date.today + 1).strftime('%Y-%m-%d')

p today
p yesterday
p tomorrow
