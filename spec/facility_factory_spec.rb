require 'spec_helper'

RSpec.describe FacilityFactory do
    before(:each) do
        @facility = FacilityFactory.new
        @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
        @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
    end

    describe 'exists' do
        it 'can exist' do
            expect(@facility).to be_an_instance_of(FacilityFactory)
        end
    end

    describe 'creates an array' do
        it 'can create an array from DMV data' do
            expect(@facility.create_ny_facility(@new_york_facilities)).to be_an_instance_of(Array)
        end
    end

    describe 'creates facilities' do
        it 'creates a Facility object from each facility' do
            facility = @facility.create_ny_facility(@new_york_facilities)

            expect(facility).to all(be_an_instance_of(Facility))
        end

        it 'each facility has data in each category' do
            facility = @facility.create_ny_facility(@new_york_facilities)

            expect(facility[0].name).to be_an_instance_of(String)
            expect(facility[0].name).not_to eq("")

            expect(facility[0].address).to be_an_instance_of(String)
            expect(facility[0].address).not_to eq("")
            
            expect(facility[0].phone).to be_an_instance_of(String)
            expect(facility[0].phone).not_to eq("")
        end
    end



end