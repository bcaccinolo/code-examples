# frozen_string_literal: true

# With an OpenStruct it doesn't work

require 'ostruct'
o = OpenStruct.new(eacht: -> { [{ id: 1, name: 'Paul' }, { id: 2, name: 'Jean' }].each { |o| yield(o) } })

# o.eacht do |e|
#   puts 'in it   💥'
#   puts e
# end


# With an OpenStruct and a block : it works fine 🚀

 o2= Struct.new(:id) do
  def eacht
    [{ id: 1, name: 'Paul' }, { id: 2, name: 'Jean' }].each { |o| yield(o) }
  end
end

o2_instance = o2.new(42)

require 'pry'; binding.pry # 🚧 🚜

o2.eacht do |e|
  puts 'in it   💥'
  puts e
end

# With an object : it works fine 🚀

class MyObject
  def eacht
    [{ id: 1, name: 'Paul' }, { id: 2, name: 'Jean' }].each do |o|
      yield(o)
    end
  end
end

# oo = MyObject.new
# oo.eacht{|e| puts(e) }
