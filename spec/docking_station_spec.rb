require 'docking_station'

describe DockingStation do
  subject(:station) {described_class.new}
  let(:bike) {double('bike', broken: false)}

  it 'releases working bikes' do
    allow(bike).to receive(:broken?).and_return(false)
    station.dock_bike(bike)
    bikey = station.release_bike
    expect(bikey.broken).to be_falsy
  end

  it 'docks a bike' do
    station.dock_bike(bike)
    bike = station.bikes
    expect(station).to respond_to :dock_bike
    expect(station.bikes).to eq bike
  end

  it 'returns instance of the docked bike' do
    allow(bike).to receive(:broken?).and_return(false)
    station.dock_bike(bike)
    bikes = station.bikes
    expect(station.view_bikes).to eq bikes
  end

  it 'should raise an error when no bikes' do
    expect {station.release_bike}.to raise_error('No bike')
  end

  it 'should raise an error when docking station is full' do
    #Putting 20 bikes in to test the 21st bike coming in on the below test
    DockingStation::DEFAULT_CAPACITY.times {station.dock_bike(bike)}
    expect {station.dock_bike(bike)}.to raise_error('No capacity')
  end

  it 'should not respond to private methods' do
    expect(station).not_to respond_to :empty?
    expect(station).not_to respond_to :full?
  end

  it 'DockingStation should accept an argument for capacity' do
    new_station = DockingStation.new(5)
    5.times {new_station.dock_bike(bike)}
    expect {new_station.dock_bike(bike)}.to raise_error('No capacity')
  end

  it "User can't release a broken bike" do
    allow(bike).to receive(:broken?).and_return(true)
    station.dock_bike(bike)
    expect{station.release_bike}.to raise_error('No working bikes!')
    end

    it "release bike and get working bike" do
      bikey = Bike.new
      station.dock_bike(bikey, false)
      crikey = Bike.new
      station.dock_bike(crikey, true)
      expect(station.release_bike).to eq bikey
    end

end
