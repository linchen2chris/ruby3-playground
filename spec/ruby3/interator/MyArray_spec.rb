require 'ruby3/interator/MyArray'
RSpec.describe do
  it 'map should works' do
    my_array = MyArray.new([1, 2, 3])
    new_array = my_array.my_map { |data| data + 3 }
    expect(new_array).to eq([4, 5, 6])
  end
end
