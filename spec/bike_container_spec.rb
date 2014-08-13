require './lib/bike_container'

shared_examples 'a bike container' do

class  ContainerHolder; include BikeContainer; end


describe BikeContainer do

  let(:bike) { Bike.new }
  let(:holder) { ContainerHolder.new }

  it 'should accept a bike' do
    # we expect the holder to have 0 bikes
    expect(holder.bike_count).to eq(0)
    # Let's dock a bike into the holder
    holder.dock(bike)
    # now we expect the holder to have 1 bike
    expect(holder.bike_count).to eq(1)
  end

    it "should release a bike" do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bike_count).to eq(0)
  end

  def fill_holder(holder)
    holder.capacity.times { holder.dock(Bike.new) }
  end

  it "should know when it's full" do
    expect(holder.full?).to be false
    fill_holder(holder)
    expect(holder.full?).to be true
  end


  it "should not accept a bike if it's full" do
    fill_holder(holder)
    expect{holder.dock(bike) }.to raise_error(RuntimeError)
  end

  it "should provide the list of available bikes" do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break!
    holder.dock(working_bike)
    holder.dock(broken_bike)
    expect(holder.available_bikes).to eq([working_bike])
  end

end
end
