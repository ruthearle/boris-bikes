module BikeContainer

  DEFAULT_CAPACITY = 10

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||=DEFAULT_CAPACITY
  end

  def capacity=(value)
    @capacity = value
  end

  def bike_count
    bikes.count
  end

  def dock(bike)
    raise "Station is full" if full?
    bikes << bike
    puts self.class
  end

  def broken_bike_count
    broken_bikes.count
  end

  def broken_bikes
    @broken_bikes ||= []
  end

  def broken_bike
    bikes.select { |bike| bike.broken?}
  end


  def release(bike)
    bikes.delete(bike)
  end

  def full?
    bike_count == capacity
  end

  def available_bikes
    bikes.reject { |bike| bike.broken? }
  end

end
