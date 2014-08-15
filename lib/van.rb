require_relative 'bike_container'

class Van

  include BikeContainer

 

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
    @location = location 
  end

  def collect(station)
    station.bikes.each do |bike|
      if bike.broken?
        self.dock(bike)
        station.release(bike)
      end
    end
  end
def location(where)
		@location = where
end


end
