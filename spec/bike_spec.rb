require 'bike'

describe Bike do

  before(:each) do
   @bike = Bike.new
  end

  it { is_expected.to respond_to :working? }

  it 'test bike can be reported broken' do
    expect(@bike.broken?).to be_falsy
  end
end
