require_relative 'transport'
require_relative 'constants'

class Car < Transport
  attr_accessor :number

  def initialize
    super(Constants::CARS[:max_weight], Constants::CARS[:speed], true)
  end
end
