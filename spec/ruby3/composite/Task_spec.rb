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
end
