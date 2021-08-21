require_relative 'transport'
require_relative 'constants'

class Car < Transport
  attr_accessor :number

  def initialize
    @speed      = Constants::CARS[:speed]
    @max_weight = Constants::CARS[:max_weight]
    @available  = true
  end
end
