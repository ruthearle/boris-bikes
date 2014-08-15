require './lib/bike_container'

shared_examples 'a bike container' do

class  ContainerHolder; include BikeContainer; end


describe BikeContainer do

  let(:bike)         { double :bike                 }
  let(:working_bike) { double :bike, broken?: false }
  let(:broken_bike)  { double :bike, broken?: true  }
  let(:holder)       { ContainerHolder.new          }

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
    holder.capacity.times { holder.dock(bike) }
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
    allow(broken_bike).to receive(:break!)
    holder.dock(working_bike)
    holder.dock(broken_bike)
    expect(holder.available_bikes).to eq([working_bike])
  end

  it 'should know where the bike is located' do
    holder.dock(bike)
    allow(bike).to receive(:location)
    expect(bike.location).to eq holder.class
  end
end
end
