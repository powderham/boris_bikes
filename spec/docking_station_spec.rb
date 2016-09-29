require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'docks a bike' do
    bike = subject.release_bike
    # expect(bike).to be_docked
    expect(subject).to respond_to :dock_bike
    subject.dock_bike(bike)
    expect(subject.bike).to eq bike
  end
end
