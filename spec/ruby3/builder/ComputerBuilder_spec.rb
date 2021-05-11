require 'ruby3/builder/ComputerBuilder'
RSpec.describe do
  it 'should build a good computer' do
    computer = Computerbuilder.new
    computer.add_cpu
    computer.add_memory(256)
    expect(computer.computer.motherboard.cpu.to_string).to eql 'good CPU'
  end
end
