describe DeliveryService do
  let(:delivery_service) { described_class.new }

  describe '.new' do
    it do
      expect(delivery_service).to be_instance_of(DeliveryService)
    end
  end

  describe '@cars' do
    it 'returns the array of Car objects' do
      expect(delivery_service.cars).to be_kind_of(Array)
    end
  end

  describe '@bikes' do
    it 'returns the array of Bike objects' do
      expect(delivery_service.bikes).to be_kind_of(Array)
    end
  end

  describe '#create_delivery' do
    context 'when weight > 10, distance > 30' do
      let(:weight_for_car) { 11 }
      let(:distance_for_car) { 31 }
      let(:car_delivery) { delivery_service.create_delivery(weight_for_car, distance_for_car) }

      context 'when cars available' do
        describe '@cars' do
          it 'returns the Array' do
            cars = delivery_service.cars.map(&:available)
            expect(cars).to eq([true, true])
          end
        end

        it 'returns the String' do
          expect(car_delivery).to eq('by car')
          expect(car_delivery).to be_kind_of(String)
        end

        it 'changes (car.available = true) to false' do
          expect(delivery_service.cars.first.available).to be_truthy

          car_delivery

          expect(delivery_service.cars.first.available).to be_falsey
          expect(delivery_service.cars.last.available).to be_truthy 
        end
      end

      context 'when cars not available' do
        describe '@cars' do
          it 'returns the Array' do
            2.times { delivery_service.create_delivery(weight_for_car, distance_for_car) }
            cars = delivery_service.cars.map(&:available)
            expect(cars).to eq([false, false])
          end
        end

        it 'returns the String' do
          2.times { delivery_service.create_delivery(weight_for_car, distance_for_car) }

          expect(car_delivery).to be_kind_of(String)
          expect(car_delivery).to eq('car unavailable, try again later.')
        end
      end
    end

    context 'when weight <= 10, distance <= 30' do
      let(:weight_for_bike) { 10 }
      let(:distance_for_bike) { 30 }
      let(:bike_delivery) { delivery_service.create_delivery(weight_for_bike, distance_for_bike) }

      context 'when bikes available' do
        describe '@bikes' do
          it 'returns the Array' do
            bikes = delivery_service.bikes.map(&:available)
            expect(bikes).to eq([true, true, true])
          end
        end

        it 'returns the String' do
          expect(bike_delivery).to eq('by bike')
          expect(bike_delivery).to be_kind_of(String)
        end

        it 'changes (bike.available = true) to false' do
          expect(delivery_service.bikes.first.available).to be_truthy

          bike_delivery

          expect(delivery_service.bikes.first.available).to be_falsey
          expect(delivery_service.bikes.last.available).to be_truthy 
        end
      end

      context 'when bikes not available' do
        describe '@bikes' do
          it 'returns the Array' do
            3.times { delivery_service.create_delivery(weight_for_bike, distance_for_bike) }
            bikes = delivery_service.bikes.map(&:available)

            expect(bikes).to eq([false, false, false])
          end
        end

        it 'returns the String' do
          3.times { delivery_service.create_delivery(weight_for_bike, distance_for_bike) }

          expect(bike_delivery).to be_kind_of(String)
          expect(bike_delivery).to eq('bike unavailable, try again later.')
        end
      end
    end
  end
end
