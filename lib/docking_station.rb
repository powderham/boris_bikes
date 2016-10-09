require_relative 'bike'

class DockingStation
  attr_accessor :bike, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    #Calls private method empty to return T/F depending on the private method
    raise 'No bike' if empty?
    raise "No working bikes!" if all_broken_bikes?
    if @bikes.last.broken? == false
      @bikes.pop
    else
      @bikes.rotate!
      release_bike
    end
  end

  def dock_bike(bike, broken = false)
    raise 'No capacity' if full?
    bike.report_broken if broken == true
      @bikes << bike
  end

  def view_bikes
    @bikes
  end

  private
  #At the bottom because anything below this will be private
    def empty?
      #Returns false if condition is not true
      @bikes.length < 1
    end

    def full?
      @bikes.length >= capacity
    end

    def all_broken_bikes?
      @bikes.all? {|bike| bike.broken? == true}
    end

end
