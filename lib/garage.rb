require 'bike_container'

class Garage

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def fix_bike!(bike)
    raise "This is a working bike!" if bike.broken?
    bike.fix!

  end
end
