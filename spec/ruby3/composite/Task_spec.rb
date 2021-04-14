require 'ruby3/composite/Task'

RSpec.describe do
  it 'get composite time' do
    compositeTask = PrepareDoughTask.new
    expect(compositeTask.get_time_required).to eq(13.9)
  end
end
