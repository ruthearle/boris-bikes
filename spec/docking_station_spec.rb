require 'docking_station'

describe DockingStation do
  let(:station) {DockingStation.new(:capacity => 20)}
  let(:bike) {Bike.new}



  it "should provide the list of available bikes" do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break!
    station.dock(working_bike)
    station.dock(broken_bike)
    expect(station.available_bikes).to eq([working_bike])
  end


end
