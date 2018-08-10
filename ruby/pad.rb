

require 'net/http'

result = []
regexp = /Net::HTTP(.*)/

Net::HTTPResponse::CODE_TO_OBJ.each do |cc|
  cls = cc[1].to_s
  res = regexp.match(cls)
  cc << res[1].underscore
  result << cc
end ; nil


puts result

result.each do |line|
  puts "#{line[0].to_i}, #{line[2]}, #{line[1]}"
end ; nil

