class Computer
  attr_accessor :motherboard
  def motherboard
    @motherboard = Motherboard.new
  end
end
class Motherboard
  attr_accessor :cpu, :memory
  def cpu(cpu)
    @cpu = cpu
  end
  def memory(mem)
    @memory = mem
  end
end
class CPU
  def to_string
    'good CPU'
  end
end

class Memory
  def initialize(size_in_mb)
    @size = size_in_mb
  end
  def to_string
    "memory with #{@size}"
  end
end

class Computerbuilder
  attr_reader :computer
  def initialize
    @computer = Computer.new
  end
  def add_cpu
    @computer.motherboard.cpu(CPU.new)
  end
  def add_memory(size_in_mb)
    @computer.motherboard.memory(Memory.new(size_in_mb))
  end
  def computer
    @computer
  end
end
