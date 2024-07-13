require 'spec_helper'

RSpec.describe Facility do
  
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
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

  describe '#has service?' do
    it 'can check if a facility has a service' do
      expect(@facility.has_service?('Vehicle Registration')).to eq(false)
    end
  end

  describe '#allow_service' do
    it 'allows a service that has been added' do
      @facility.add_service('Vehicle Registration')
      @facility.has_service?('Vehicle Registration')
      # require'pry';binding.pry
      expect(@facility.allow_service('Vehicle Registration'){'Registered'}).to eq('Registered')     
    end
  end

  describe '#allow_service' do
    it 'doesnt allow a service that hasnt been added' do
      expect(@facility.allow_service('Vehicle Registration'){'Registered'}).to eq(false)     
    end
  end

  describe '#registered vehicles' do
    it 'can list vehicles that have been registered at a facility' do
      expect(@facility.registered_vehicles).to eq([])
    end
  end

  describe '#collected fees' do
    it 'shows that collected fees defaults at 0' do
      expect(@facility.collected_fees).to eq(0)
    end
  end

  describe '#register_vehicle' do
    it 'can register a vehicle' do
      @facility.add_service('Vehicle Registration')
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      expect(@facility.register_vehicle(@cruz)).to eq([@cruz])
    end
  end

  describe '#registered vehicles' do
    it 'can add to registered vehicles array' do
      @facility.add_service('Vehicle Registration')
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @facility.register_vehicle(@cruz)
      expect(@facility.registered_vehicles).to eq([@cruz])
    end
  end

  describe '#registration date' do
    it 'can assign a registration date' do
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date.today)
    end
  end

  describe '#plate type' do
    it 'plate type defaults to nil' do
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      expect(@cruz.plate_type).to eq(nil)
    end
  end

  describe '#plate type' do
    it 'can assign plate type' do
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(@cruz)
      expect(@cruz.plate_type).to eq(:regular)
    end
  end

  describe '#collect fees' do
    it 'can collect fees upon registration' do
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(@cruz)
      expect(@facility.collected_fees).to eq(100)
    end
  end

  describe '#administer written test' do
    it 'administer written test defaults to false' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      expect(@facility.administer_written_test(registrant_1)).to eq(false)
    end
  end

  describe '#administer_written_test' do
    it 'administers written test to true when service added' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      @facility.add_service('Written Test')
      expect(@facility.administer_written_test(registrant_1)).to eq(true)
      expect(registrant_1.license_data[:written]).to eq(true)
    end
  end

  describe '#administer_written_test' do
  it 'doesnt administers written test without permit' do
    registrant_2 = Registrant.new('Penny', 16 )
    @facility.add_service('Written Test')
    expect(@facility.administer_written_test(registrant_2)).to eq(false)
    expect(registrant_2.license_data[:written]).to eq(false)
    registrant_2.earn_permit
    expect(@facility.administer_written_test(registrant_2)).to eq(true)
    expect(registrant_2.license_data[:written]).to eq(true)
  end
end

  describe 'no written test for under 16' do
    it 'doesnt allow a written test for people under 16 years old' do
      registrant_3 = Registrant.new('Tucker', 15 )
      @facility.add_service('Written Test')
      registrant_3.earn_permit
      expect(@facility.administer_written_test(registrant_3)).to eq(false)
      expect(registrant_3.license_data[:written]).to eq(false)
    end
  end

  describe 'road test' do
    it 'administers a road test' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      @facility.add_service('Written Test')
      @facility.administer_written_test(registrant_1)
      expect(@facility.administer_road_test(registrant_1)).to eq(true)
    end
  end

  # registrant_1 = Registrant.new('Bruce', 18, true )
  # registrant_3 = Registrant.new('Tucker', 15 )
end

# require'pry';binding.pry