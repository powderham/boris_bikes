require_relative 'bike'

class DockingStation
  attr_accessor :bike, :capacity

  def initialize(capacity)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No bike' if @bikes.length < 1
    @bikes.pop()
  end

  def dock_bike(bike)
    raise 'No capacity' if @bikes.length >= capacity
    @bikes << bike
  end

  def view_bike
    @bikes
  end
end
