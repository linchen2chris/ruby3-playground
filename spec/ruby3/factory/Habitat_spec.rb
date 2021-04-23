require 'ruby3/factory/Habitat'
require 'ruby3/factory/Pond'
require 'ruby3/factory/Jungle'
RSpec.describe do
  it 'works' do
    pond = Habitat.new(1, 1, PondFactory.new)
    expect(pond.one_day).to eql 'Duck: 0 says QuackWaterLily: 0 grows'
  end
  it 'Jungle' do
    jungle = Habitat.new(1, 2, JungleFactory.new)
    expect(jungle.one_day).to eql 'Tiger: 0 says RoarTree: 0 growsTree: 1 grows'
  end
end
