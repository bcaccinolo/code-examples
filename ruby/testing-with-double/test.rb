require './account.rb'
require './transfer_service.rb'

describe TransferService do
  it 'should work' do
    a = instance_double(Account)
    expect(a).to receive(:decrease).with(100)

    b = instance_double(Account)
    expect(b).to receive(:increase)

    TransferService.transfer(a, b, 100)
  end
end
