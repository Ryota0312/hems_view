require 'date'

s = DateTime.new(2016, 4, 1)
e = DateTime.new(2017, 3, 31)

for date in s..e
  puts date
end
