require_relative 'bike'

class DockingStation
  attr_accessor :bike

  def initialize
    @bike = []
  end

  def release_bike
    raise 'No bike' if @bike.length < 1
    Bike.new
  end

  def dock_bike(bike)
    raise 'No capacity' if @bike.length > 0
    @bike.push(bike)
  end

  def view_bike
    @bike
  end
end
