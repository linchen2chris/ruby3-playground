require 'ruby3/builder/ComputerBuilder'
RSpec.describe do
  xit 'should build a good computer' do
    computer_builder = Computerbuilder.new
    computer_builder.add_cpu
    computer_builder.add_memory(256)
    expect(
      computer_builder.computer.motherboard.cpu.to_string
    ).to eql 'good CPU'
  end
end
