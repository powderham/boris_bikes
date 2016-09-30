require 'docking_station'

describe DockingStation do

  before(:each) do
    #Variables to be set up ahead of running any test so that they can be referenced
    @bike = Bike.new
    @station = DockingStation.new(1)
  end

  it 'releases working bikes' do
    @station.dock_bike(@bike)
    bike = @station.release_bike
    expect(bike).to be_working
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
    #expect error when trying to dock a bike when number of bikes in docking station is >1
    @station.dock_bike(@bike)
    expect {@station.dock_bike(@bike)}.to raise_error('No capacity')
  end



end
