class Transport
  include Comparable

  attr_accessor :max_weight, :speed, :available
  attr_reader :delivery_speed_by_weight

  def <=>(other)
    delivery_speed_by_weight <=> other.delivery_speed_by_weight
  end

  def initialize(max_weight, speed, available)
    @max_weight = max_weight
    @speed = speed
    @available = available
  end

  def delivery_time(distance)
    (distance / speed.to_f).round(2)
  end

  def delivery_speed_by_weight
    (speed.to_f / max_weight).round(2)
  end
end
