class Transport
  attr_accessor :max_weight, :speed, :available

  def delivery_time(distance)
    (distance / speed.to_f).round(2)
  end

  def delivery_speed_by_weight
    (speed.to_f / max_weight).round(2)
  end
end
