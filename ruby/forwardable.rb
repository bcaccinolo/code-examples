require 'forwardable'

class RecordCollection
  attr_accessor :records
  extend Forwardable
  def_delegator :@records, :[], :record_number
end


r = RecordCollection.new
r.records = [4,5,6]
r.record_number(0)  # => 4
