require 'van'

describe Van do

  let(:van) {Van.new(:capacity => 123)}
  it 'should be able to set a default capacity on initialisation' do
    expect(van.capacity).to eq (123)
  end

end

