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

class PrepareDoughTask < Task
  def initialize
    super('prepare_dough')
    @subtask = []
    add_subtask(AddFlourTask.new)
    add_subtask(MixTask.new)
  end

  def add_subtask(task)
    @subtask << task
  end

  def remove_task(task)
    @subtask.delete(task)
  end
  def get_time_required
    @subtask.reduce(0) { |sum, task| sum + task.get_time_required }
  end
end
