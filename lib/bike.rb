require_relative 'transport'
require_relative 'constants'

class Bike < Transport
  attr_reader :max_distance

  def initialize
    @speed        = Constants::BIKES[:speed]
    @max_weight   = Constants::BIKES[:max_weight]
    @max_distance = Constants::BIKES[:max_distance]
    @available    = true
  end
end
