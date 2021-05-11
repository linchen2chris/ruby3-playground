require 'ruby3/repl/Express'
RSpec.describe do
  it 'should find all' do
    all_expr = All.new
    files = all_expr.evaluate('./spec/ruby3/repl')
    expect(files).to eql ['./spec/ruby3/repl/Express_spec.rb']
  end
end
