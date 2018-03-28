

# Generate OAuth like token
#  - base64 generated
#  - 64 chars length
def generate_token
  s = (0..120).map {|i| rand(20).to_s }.join
  r = Base64.encode64 s
  r.gsub!(/\n/, "")
  r.slice!(0..10) # removing the 10 first chars
  r.slice!(0..63)
end
generate_token

20.times do |i|
  puts generate_token
end
