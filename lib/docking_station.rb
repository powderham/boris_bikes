require_relative 'bike'

class DockingStation
  attr_reader :bike

  # @bike = bike

  def release_bike
    Bike.new
  end

  def dock_bike(bike)
    @bike = bike
  end
end
