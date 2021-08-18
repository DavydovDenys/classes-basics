require_relative 'transport'

class Bike < Transport
  attr_reader :max_distance

  def initialize
    @speed = 10
    @max_weight = 10
    @max_distance = 30
  end

  def available
    Car.availability.bikes
  end
end