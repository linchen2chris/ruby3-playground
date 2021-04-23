class JungleFactory
  def new_animal(name)
    Tiger.new("Tiger: #{name}")
  end
  def new_plant(name)
    Tree.new("Tree: #{name}")
  end
end

class Tiger
  def initialize(name)
    @name = name
  end
  def say
    "#{@name} says Roar"
  end
end

class Tree
  def initialize(name)
    @name = name
  end

  def grow
    "#{@name} grows"
  end
end
