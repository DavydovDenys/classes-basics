require_relative 'vehicle_availabilities'

class Transport
  extend VehicleAvailabilities
  attr_accessor :max_weight, :speed, :available

  def delivery_time(distance)
    (distance / speed.to_f).round(2)
  end

  def delivery_speed_per_kg
    (speed.to_f / max_weight).round(2)
  end

  def available_vehicle
    { cars: Transport.availability.cars, bikes: Transport.availability.bikes }
  end
end
