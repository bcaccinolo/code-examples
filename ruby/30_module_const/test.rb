module Test

  CCC = "const"

  class << self
  def call
    p "calling"
  end
end

end

p Test::CCC
Test.call

