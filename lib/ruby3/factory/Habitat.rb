class Habitat
  def initialize(num_animal, num_plant, factory)
    @animals = []
    num_animal.times { |i| @animals << factory.new_animal(i) }
    @plants = []
    num_plant.times { |i| @plants << factory.new_plant(i) }
  end

  def one_day
    @animals.map { |ani| ani.say }.join('') +
      @plants.map { |pla| pla.grow }.join('')
  end
end
