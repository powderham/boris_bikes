require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'docks a bike' do
    bike = subject.release_bike
    expect(bike).to be_docked
    expect(subject).to respond_to :dock_bike
    subject.dock_bike(bike)
    expect(subject.bike).to eq bike
  end

  it 'returns instance of the docked bike', focus: true do
    expect(subject).to respond_to :view_bike
    bike = subject.release_bike
    subject.dock_bike(bike)
    expect(subject.view_bike).to be bike
  end
end
