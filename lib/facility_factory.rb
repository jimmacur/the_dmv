class FacilityFactory
    def initialize
    end

    def create_ny_facility(dmv_locations)
        dmv_locations.map do |location|
          Facility.new(
            name: location[:office_name],
            address: "#{location[:street_address_line_1]}, #{location[:city]}, #{location[:state]}, #{location[:zip_code]}",
            phone: location[:public_phone_number]
          )
        end
    end
    
    def create_mo_facility(dmv_locations)
        dmv_locations.map do |location|
          Facility.new(
            name: location[:name],
            address: "#{location[:address1]}, #{location[:city]}, #{location[:state]}, #{location[:zipcode]}",
            phone: location[:phone]
          )
        end
    end
     
end