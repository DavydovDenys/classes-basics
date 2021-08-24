require_relative 'transport'
require_relative 'constants'

class Bike < Transport
  attr_reader :max_distance

  def initialize
    super(Constants::BIKES[:max_weight], Constants::BIKES[:speed], true)
    @max_distance = Constants::BIKES[:max_distance]
  end
end
