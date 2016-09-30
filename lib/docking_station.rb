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
    @bikes.pop()
  end

  def dock_bike(bike, broken = false)
    bike.broken? if broken == true
    raise 'No capacity' if full?

      @bikes << bike
  end

  def view_bike
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
      bb_count = 0

      @bikes.each do |bike|
        bb_count += 1  if bike.broken == true
      end
      bb_count == @bikes.length
      #print bb_count
      #print "This is #{@bikes.length}"
    end

end
