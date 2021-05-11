require 'ruby3/repl/Express'
RSpec.describe do
  it 'should find all' do
    all_expr = All.new
    files = all_expr.evaluate('./spec/ruby3/repl')
    expect(files).to eql %w[
          ./spec/ruby3/repl/2KB.txt
          ./spec/ruby3/repl/Express_spec.rb
        ]
  end

  it 'no big file' do
    bigger = Bigger.new(2000)
    files = bigger.evaluate('./spec/ruby3/repl')
    expect(files).to eql ['./spec/ruby3/repl/2KB.txt']
  end

  it 'And works' do
    all = All.new
    bigger = Bigger.new(2000)
    and_expr = And.new(all, bigger)
    files = and_expr.evaluate('./spec/ruby3/repl')
    expect(files).to eql(['./spec/ruby3/repl/2KB.txt'])
  end
end
