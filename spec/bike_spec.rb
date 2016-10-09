require 'bike'

describe Bike do

  subject(:bike) {described_class.new}

  it 'test bike can be reported broken' do
    expect(bike.broken).to be_falsy
    bike.report_broken
    expect(bike.broken?).to be_truthy
  end
end
