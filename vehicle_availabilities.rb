require_relative 'constants'

module VehicleAvailabilities
  Availability = Struct.new(:cars, :bikes)
  AVAILABILITY = Availability.new(Constants::CARS, Constants::BIKES)

  def availability
     AVAILABILITY
  end
end
