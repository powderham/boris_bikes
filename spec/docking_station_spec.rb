require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    subject.dock_bike(Bike.new)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'docks a bike' do
    subject.dock_bike(Bike.new)
    bike = subject.bike
    expect(subject).to respond_to :dock_bike
    # subject.dock_bike(bike)
    expect(subject.bike).to eq bike

    #Updated from Old version to avoid creating 2 instances of bike

  end

  it 'returns instance of the docked bike' do
    subject.dock_bike(Bike.new)
    expect(subject).to respond_to :view_bike
    bike = subject.release_bike
    subject.dock_bike(bike)
    expect(subject.view_bike).to be [bike]
  end

  it 'should raise an error when no bikes' do
    expect { subject.release_bike }.to raise_error('No bike')
  end

  it 'should raise an error when docking station is full' do
    #expect error when trying to dock a bike when number of bikes in docking station is >1
    expect { subject.dock_bike(Bike.new)}.to raise_error('No capacity')
  end

end
