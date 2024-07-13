class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees


  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def has_service?(service)
    @services.include?(service)
   end

  def allow_service(service)
    if has_service?(service)
      yield
    else
      false
    end
  end

  def register_vehicle(vehicle)
    allow_service('Vehicle Registration') do
      @registered_vehicles << vehicle
      vehicle.set_date
      vehicle.give_plate
      if vehicle.plate_type == :ev
       @collected_fees += 200
      elsif vehicle.plate_type == :antique
        @collected_fees += 25
      else
        @collected_fees += 100
      end
      return [vehicle]
    end
  end

  def administer_written_test(registrant)
    return false unless registrant.age > 15
    return false unless registrant.permit? == true
    allow_service('Written Test') do
      registrant.license_data[:written] = true
    end
  end

  def  administer_road_test(registrant)
    return false
  end

end
