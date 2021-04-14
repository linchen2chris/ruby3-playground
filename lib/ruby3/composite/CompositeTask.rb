class CompositeTask < Task
  def initialize(name)
    super(name)
    @subtask = []
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

  def <<(task)
    @subtask << task
  end

  def [](index)
    @subtask[index]
  end
end

class PrepareDoughTask < CompositeTask
  def initialize
    super('prepare_Douth')
    add_subtask(AddFlourTask.new)
    add_subtask(MixTask.new)
  end
end
