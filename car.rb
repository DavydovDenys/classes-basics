require_relative 'transport'

class Car < Transport
  attr_accessor :number

  def initialize
    @speed = 50
    @max_weight = 100
  end

  def available
    Car.availability.cars
  end
end
