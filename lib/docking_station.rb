require_relative 'bike'

class DockingStation
  attr_reader :bike

  # @bike = bike

  def release_bike
    raise 'No bike' unless @bike
    Bike.new
  end

  def dock_bike(bike)
    @bike = bike
  end

  def view_bike
    @bike
  end
end
