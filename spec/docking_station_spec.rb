require 'docking_station'

describe DockingStation do

  before(:each) do
    #Variables to be set up ahead of running any test so that they can be referenced
    @bike = Bike.new
    @station = DockingStation.new
  end

  it 'releases working bikes' do
    @station.dock_bike(@bike)
    bike = @station.release_bike
    expect(bike.broken).to be_falsy
  end

  it 'docks a bike' do
    @station.dock_bike(@bike)
    bike = @station.bike
    expect(@station).to respond_to :dock_bike
    expect(@station.bike).to eq bike
  end

  it 'returns instance of the docked bike' do
    expect(@station).to respond_to :view_bike
    @station.dock_bike(@bike)
    bike = @station.bike
    expect(@station.view_bike).to eq [@bike]
  end

  it 'should raise an error when no bikes' do
    expect {@station.release_bike}.to raise_error('No bike')
  end

  it 'should raise an error when docking station is full' do
    #Putting 20 bikes in to test the 21st bike coming in on the below test
    20.times {@station.dock_bike(@bike)}
    expect {@station.dock_bike(@bike)}.to raise_error('No capacity')
  end

  it 'should not respond to private methods' do
    expect(@station).not_to respond_to :empty?
    expect(@station).not_to respond_to :full?
  end

  it 'DockingStation should accept an argument for capacity' do
    new_station = DockingStation.new(5)
    5.times {new_station.dock_bike(@bike)}
    expect {new_station.dock_bike(@bike)}.to raise_error('No capacity')
  end

  it 'User can report bike as broken when returning bike' do
    @station.dock_bike(@bike)
    expect(@bike.broken).to be false
    bikey = @station.release_bike
    @station.dock_bike(@bike, true)
    expect(bikey.broken).to be true
  end
end
