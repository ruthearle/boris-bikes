require 'bike_container'

class Garage

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def fix_bike!(bike)
	false
  end 
end
