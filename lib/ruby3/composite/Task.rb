class Task
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_time_required
    0.0
  end
end

class AddFlourTask < Task
  def initialize
    super('add_Flour')
  end
  def get_time_required
    3.0
  end
end

class MixTask < Task
  def initialize
    super('mix')
  end
  def get_time_required
    10.9
  end
end
