require 'spec_helper'

RSpec.describe VehicleFactory do
    describe 'Vehicle Factory' do
        it 'exists' do
            expect(vehicle_factory).to be_an_instance_of(VehicleFactory)
        end
    end
end