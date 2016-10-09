class Bike

  #Accessor to allow reading and writing
  attr_reader :broken

  def initialize(broken = false)
    @broken = broken
  end

  def report_broken
    @broken = true
  end

  #Methods to report bikes as broken or working
  def broken?
    @broken == true
  end
end
