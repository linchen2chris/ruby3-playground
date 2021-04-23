class PondFactory
  def new_animal(name)
    Duck.new("Duck: #{name}")
  end
  def new_plant(name)
    WaterLily.new("WaterLily: #{name}")
  end
end

class Duck
  def initialize(name)
    @name = name
  end
  def say
    "#{@name} says Quack"
  end
end

class WaterLily
  def initialize(name)
    @name = name
  end

  def grow
    "#{@name} grows"
  end
end
