require 'bike'

describe Bike do

  before(:each) do
   @bike = Bike.new
  end

  it 'test bike can be reported broken' do
    @bike
    expect(@bike.broken).to be_falsy
    @bike.broken?
    expect(@bike.broken?).to be_truthy
  end
end
