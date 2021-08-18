require_relative 'car'
require_relative 'bike'
require_relative 'vehicle_availabilities'


class DeliveryService
  extend VehicleAvailabilities

  def initialize
    @cars = DeliveryService.availability
  end

  def vehicle(weight, distance)
    bikes = bikes()
    if weight <= 10 && distance <= 30
      if bikes.bikes.zero?
        'bike unavailable, try again later.'
      else
        bikes.bikes -= 1
        'by bike'
      end
    else
      if @cars.cars.zero?
        'car unavailable, try again later.'
      else
        @cars.cars -= 1
        'by car'
      end
    end 
  end

  private

  def bikes
    DeliveryService.availability
  end
end

car = Car.new
bike =Bike.new
transport = Transport.new
delivery_service = DeliveryService.new

p car.delivery_time(100)
p bike.delivery_time(100)
p car.delivery_speed_per_kg == bike.delivery_speed_per_kg
p bike.delivery_speed_per_kg
