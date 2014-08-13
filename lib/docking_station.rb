# Load BikeContainer
require_relative 'bike_container'

class DockingStation

  # this gives us all the methods that used to be in the class
  include BikeContainer

  def initialize(options = {})
    # self.capacity is calling the capacity=() method
    # (note he equals sign) defined in BikeContainer
    # capacity (the second argument to fetch()) is calling
    # the capacity() method in BikeContainer
    self.capacity = options.fetch(:capacity, capacity)
  end

end
