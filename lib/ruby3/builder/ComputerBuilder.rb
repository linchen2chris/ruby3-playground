class Computer
  def motherboard
    @motherboard = Motherboard.new
    @motherboard
  end
end
class Motherboard
  def set_cpu(cpu)
    puts cpu.to_string
    @cpu = cpu
  end
  def memory(mem)
    @memory = mem
  end
  def cpu
    puts @cpu.to_string
    @cpu
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
  def initialize
    @computer = Computer.new
  end
  def add_cpu
    @computer.motherboard.set_cpu(CPU.new)
  end
  def add_memory(size_in_mb)
    @computer.motherboard.memory(Memory.new(size_in_mb))
  end
  def computer
    @computer
  end
end
