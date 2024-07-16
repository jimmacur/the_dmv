require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    @factory = VehicleFactory.new
  end

  describe '#initialize' do
    it 'initializes a vehicle class' do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe '#create_vehicles' do
    it 'sorts info into each method type' do
        vehicles = @factory.create_vehicles(@wa_ev_registrations) 
        
        expect(vehicles).to all(be_an_instance_of(Vehicle)) 
        expect(vehicles[0].vin).to be_an_instance_of(String)
        expect(vehicles[0].vin).not_to eq("")
        expect(vehicles[0].year).to be_an_instance_of(String)
        expect(vehicles[0].year).not_to eq("")
        expect(vehicles[0].make).to be_an_instance_of(String)
        expect(vehicles[0].make).not_to eq("")
        expect(vehicles[0].model).to be_an_instance_of(String)
        expect(vehicles[0].model).not_to eq("")
        expect(vehicles[0].engine).to be_an_instance_of(Symbol)
        expect(vehicles[0].engine).not_to eq("")
      end
    end

end