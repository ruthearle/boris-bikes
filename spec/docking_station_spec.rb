require './lib/docking_station'


describe DockingStation do

	it_behaves_like 'a bike container'

  let(:station) {DockingStation.new(:capacity => 20)}

  it 'should allow setting default capacity on initialising' do
    expect(station.capacity).to eq(20)
  end


end
