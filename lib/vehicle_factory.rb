class VehicleFactory
    def initialize
    end
  
    def create_vehicles(dmv_registrations)
      dmv_registrations.map do |registration|
        Vehicle.new(
          vin: registration[:vin_1_10],
          year: registration[:model_year],
          make: registration[:make],
          model: registration[:model],
          engine: :ev
        )
      end
    end
  end