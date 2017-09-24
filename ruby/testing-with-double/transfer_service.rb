# Manage transfers between accounts
class TransferService
  def self.transfer(source, destination, amount)
    source.decrease(amount)
    destination.increase(amount)
  end
end
