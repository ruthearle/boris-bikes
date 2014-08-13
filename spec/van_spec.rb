require './lib/van'

describe Van do

	it_behaves_like 'a bike container'

  let(:van) {Van.new(:capacity => 123)}
  let(:bike) {Bike.new}

  it 'should be able to set a default capacity on initialisation' do
    expect(van.capacity).to eq (123)
  end

  it 'should be able to selectively collect broken bikes' do
  	broken_bike = Bike.new
  	broken_bike.break!
  	expect(van.bike_count).to eq(0)
  	van.retrieve(broken_bike)
  	expect(van.broken_bikes.count).to eq(1)
  	expect(van.bike_count).to eq(0)
  end



end
