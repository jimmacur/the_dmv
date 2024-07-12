require 'spec_helper'

# require'pry';binding.pry

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @facility_3 = Facility.new({name: 'DMV Northwest Branch', address: '3698 W. 44th Avenue Denver CO 80211', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end
  
  describe '#registered vehicles' do
    it 'can list vehicles that have been registered at a facility' do
      expect(@facility.registered_vehicles).to eq([])
    end
  end

  describe 'collected fees' do
    it 'shows that collected fees defaults at 0' do
      expect(@facility.collected_fees).to eq(0)
    end
  end

  describe 'register_vehicle' do
    it 'can register a vehicle' do
      @facility.add_service('Vehicle Registration')
      expect(@facility.register_vehicle(@cruz)).to eq([@cruz])
    end
  end

  describe 'adds to registered vehicles' do
    it 'can add to registered vehicles array' do
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(@cruz)
      expect(@facility.registered_vehicles).to eq([@cruz])

    end
  end

  describe 'registration date' do
    it 'can assign a registration date' do
      @facility.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date.today)
    end
  end

  describe 'nil plate type' do
    it 'plate type defaults to nil' do
      expect(@cruz.plate_type).to eq(nil)
    end
  end

  describe 'plate type' do
    it 'can assign plate type' do
      @facility.register_vehicle(@cruz)
      expect(@cruz.plate_type).to eq(:regular)
    end
  end

  describe 'collect fees' do
    it 'can collect fees upon registration' do
      @facility.register_vehicle(@cruz)
      expect(@facility.get_fees).to eq(100)
    end
  end

end

# require'pry';binding.pry