# frozen_string_literal: true

require 'dry/monads/result'

class TestMonads
  extend Dry::Monads::Result::Mixin

  def self.foo(x)
    Success(x).bind do |value|
      Success(value**2)
    end.bind do |value|
      if value > 50
        Failure(:number_too_large)
      else
        Success(value)
      end
    end
  end
end

p TestMonads.foo(5)
# => Success(25)

p TestMonads.foo(10)
# => Failure(:number_too_large)
