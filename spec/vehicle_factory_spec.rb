require 'spec_helper'

RSpec.describe VehicleFactory do

    describe 'Vehicle Factory' do
        it 'exists' do
            vehicle_factory = VehicleFactory.new
            expect(vehicle_factory).to be_an_instance_of(VehicleFactory)
        end
    end
end

# require'pry';binding.pry