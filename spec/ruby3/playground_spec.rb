RSpec.describe Ruby3::Playground do
  it 'has a version number' do
    expect(Ruby3::Playground::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(true).to eq(true)
  end

  it 'try something' do
    expect(1.class).to eq(Integer)
    expect('hell'.instance_of?(String)).to eq(true)
    expect('hell'.nil?).to eq(false)
  end

  it 'try iteration' do
    i = 2
    until i >= 4
      puts("i=#{i}")
      i = i + 1
    end
    [1, 3, 4].each { |x| expect(x).to be < 5 }
    expect('hello'[0]).to eq 'h'
    expect('hello'.upcase).to eq 'HELLO'
  end
end
