# frozen_string_literal: true

module Test
  CCC = 'const'

  class << self
    def call
      p 'calling'
    end
  end

  def inst_call
    p 'instance calling'
  end

end

p Test::CCC #> 'const'

Test.call #> calling

Test.inst_call #> ERROR!


module Test
  def inst_call
    p 'instance calling'
  end
end
