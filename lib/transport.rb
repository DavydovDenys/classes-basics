class Transport
  attr_accessor :max_weight, :speed, :available

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

  def compare_delivery_speed_by_weight_with(transport)
    self.delivery_speed_by_weight == transport.delivery_speed_by_weight
  end
end
