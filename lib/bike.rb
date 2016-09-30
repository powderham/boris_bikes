class Bike

  #Accessor to allow reading and writing
  attr_accessor :broken

  def initialize(broken = false)
    @broken = broken
  end

  #Methods to report bikes as broken or working
  def broken?
    @broken = true
  end

  # def broken?
  #   @broken
  # end

  # def working?
  #   @broken = false
  # end

end
