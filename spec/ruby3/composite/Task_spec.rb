require 'ruby3/composite/Task'
require 'ruby3/composite/CompositeTask'

RSpec.describe do
  it 'get composite time' do
    compositeTask = CompositeTask.new('prepare_dough')
    compositeTask.add_subtask(AddFlourTask.new)
    compositeTask.add_subtask(MixTask.new)
    expect(compositeTask.get_time_required).to eq(13.9)
  end

  it 'generate PrepareDoughTask directly' do
    prepareDoughTask = PrepareDoughTask.new
    expect(prepareDoughTask.get_time_required).to eq(13.9)
  end

  it 'check operator works' do
    task = CompositeTask.new('composite')
    task << AddFlourTask.new
    middle = AddFlourTask.new
    task << middle
    task << AddFlourTask.new
    expect(task[1]).to eq(middle)
    expect(task.get_time_required).to eq(9)
  end
end
