require './lib/van'

describe Van do

	it_behaves_like 'a bike container'

  let(:van) {Van.new(:capacity => 123, :location => :garage)}
  let(:bike) {double :bike, broken?: false}
  let(:broken_bike) {double :bike, broken?: true}
  let(:station) {double :station, {:bikes => [bike, broken_bike]}}
  let(:garage) {double :garage}

  it 'should be able to set a default capacity on initialisation' do
    expect(van.capacity).to eq (123)
  end

  it 'should be able to selectively collect broken bikes' do
    expect(station).to receive(:release).with(broken_bike)
    van.collect(station)
    expect(van.bikes).to eq [broken_bike]
  end

end
