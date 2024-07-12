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

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
    vehicle.set_date
    vehicle.give_plate
    return [vehicle]
    # collected fees changes based on plate_type
  end

  # def get_fees
  #   if @engine == :ev
  #     @collect_fees = 200
  #   elsif @engine == :ice && Date.today.year - @year > 25
  #     @collect_fees = 25
  #   else
  #     @collect_fees = 100
  #   end
  # end

end
