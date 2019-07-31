require 'oystercard'
describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'Add money to card' do
    expect{ subject.top_up(5) }.to change { subject.balance }.by(5)
  end

  it 'raises an error if the maximum balance is exceeded' do
    amount = Oystercard::MAXIMUM_BALANCE
    subject.top_up(amount)
    expect{ subject.top_up 1 }.to raise_error 'Exceeded Maximum Balance'
  end

  # describe "#deduct" do
  # it { is_expected.to respond_to(:deduct).with(1).argument }
  # end

  # it "deducts and amount from the balance" do
  #   subject.top_up(20)
  #   expect{ subject.deduct(3) }.to change{ subject.balance }.by (-3)
  # end
  
  it "is initially not in a journey" do
    expect(subject).not_to be_in_journey
  end

  it "can touch in" do
    minimum_balance = Oystercard::MINIMUM_BALANCE
    subject.top_up(minimum_balance)
    subject.touch_in(station)
    expect(subject).to be_in_journey
  end

  it "can touch out" do
    minimum_balance = Oystercard::MINIMUM_BALANCE
    subject.top_up(minimum_balance)
    subject.touch_in(station)
    subject.touch_out(exit_station)
    expect(subject).not_to be_in_journey
  end

  it "will not touch in if below minimum balance" do
    expect{ subject.touch_in(station)}.to raise_error "Insufficient balance to touch in"
  end

#  it "checks if charge is made on touch out" do
#   subject.top_up(20)
#   expect{ subject.deduct(5) }.to change{ subject.balance }.by (-5)
#  end

let(:station){ double :station }
it "stores the entry station " do
  subject.top_up(10)
  entry_station = station
  subject.touch_in(station)
  expect(subject.entry_station).to eq station
end

let(:entry_station) {double :station }
let(:exit_station) {double :station }

it "stores exit station" do
  subject.top_up(10)
  subject.touch_in(entry_station)
  subject.touch_out(exit_station)
  expect(subject.exit_station).to eq exit_station
end

end

