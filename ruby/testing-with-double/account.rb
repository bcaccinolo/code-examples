# Simple Account class
class Account
  attr_reader :amount

  def initialize(amount = 0)
    @amount = amount
  end

  def increase(amount = 0)
    @amount += amount
  end

  def decrease(amount = 0)
    @amount -= amount
  end
end
