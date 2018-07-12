

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


# Utility methods for files
module File

  # Replaces every occurence in a file
  #
  # Example:
  #   Api::Generator::Utils::File.gsub('/path/to/file.txt', /pattern/, 'new string')
  #
  def self.gsub(file, regexp, replacement)
    content = ::File.read(file)
    content.gsub!(regexp, replacement)
    IO.write(file, content)
  end

end



# Create a contstant from a simple name
#
# Example:
#  'test-gtc_api' => 'TestGtcApi'
#
def camelize(str)
  str
  .split(/[-_]/)
  .inject('') { |product, n| product + n.capitalize }
end

str = 'api-gtc_coucou'
puts camelizeV2(str)