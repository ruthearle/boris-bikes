require 'garage'

describe Garage do

  it_behaves_like 'a bike container'
  let(:working_bike) {double :bike, broken?: false}
  let(:broken_bike)   { double :bike, broken?: true }
  let(:garage) { Garage.new(:capacity => 20)}

  it 'should be initialized with a capacity' do
    expect(garage.capacity).to eq 20
  end

  it 'should fix broken bikes' do
    expect(garage.fix_bike!(broken_bike)).to eq false
  end

  it 'should not fix working bikes' do
	expect{garage.fix_bike!(working_bike)}.to raise_error(RuntimeError)
  end

end
