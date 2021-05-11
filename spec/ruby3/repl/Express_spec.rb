require 'ruby3/repl/Express'
RSpec.describe do
  it 'should find all' do
    all_expr = All.new
    files = all_expr.evaluate('./spec/ruby3/repl')
    expect(files).to eql ['./spec/ruby3/repl/Express_spec.rb']
  end

  it 'should find big one' do
    bigger = Bigger.new(200)
    files = bigger.evaluate('./spec/ruby3/repl')
    expect(files).to eql ['./spec/ruby3/repl/Express_spec.rb']
  end

  it 'no big file' do
    bigger = Bigger.new(2000)
    files = bigger.evaluate('./spec/ruby3/repl')
    expect(files).to eql []
  end
end
