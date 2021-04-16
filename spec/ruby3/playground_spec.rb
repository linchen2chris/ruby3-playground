RSpec.describe Ruby3::Playground do
  it 'has a version number' do
    expect(Ruby3::Playground::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(true).to eq(true)
  end

  it 'try something' do
    expect(1.class).to eq(Integer)
    expect('hell'.instance_of?(String)).to eq(true)
    expect('hell'.nil?).to eq(false)
  end

  it 'try iteration' do
    i = 2
    until i >= 4
      puts("i=#{i}")
      i = i + 1
    end
    [1, 3, 4].each { |x| expect(x).to be < 5 }
    expect('hello'[0]).to eq 'h'
    expect('hello'.upcase).to eq 'HELLO'
    expect([1, 2, 3].reverse).to eq [3, 2, 1]
    obj = {}
    obj['first'] = '1'
    obj2 = { 'first' => '1' }
    obj3 = { first: '1' }
    expect(obj).to eql obj2
    expect(obj).not_to eql obj3
    expect(/old/ =~ 'this old man').to be 5 # return index match regex
  end

  context 'class' do
    class Product
      def initialize(price)
        @price = price
      end
      def price
        @price
      end
    end
    class Toy < Product
      def initialize(owner, price = 0)
        super(price)
        @owner = owner
      end
      def sell(buyer)
        @owner = buyer
      end
      def owner
        @owner
      end
    end
    it 'class demo' do
      toycar = Toy.new('chris')
      expect(toycar.class).to be Toy
      expect(toycar.owner).to eql 'chris'
      expect(toycar.sell('jack')).to eql 'jack'
      expect(toycar.owner).to eql 'jack'
    end

    it 'class inherit' do
      toycar = Toy.new('chris', 20)
      expect(toycar.price).to be 20
    end
  end

  context 'module' do
    module Hello
      def say_hi
        'hi'
      end
      def self_introduce
        "my name is #{name}, what can I do for you"
      end
    end
    class Waiter
      include Hello
      def initialize(name)
        @name = name
      end
      def name
        @name
      end
    end
    it 'waiter should say hi' do
      waiter = Waiter.new('chris')
      expect(waiter.say_hi).to eql('hi')
      expect(waiter.self_introduce).to eql(
        'my name is chris, what can I do for you'
      )
    end
  end

  context 'exception' do
    it 'raise error' do
      # 注意是大括号
      expect { raise 'oops' }.to raise_error('oops')
      expect { 3 / 0 }.to raise_exception
      expect { raise 'oops' }.to raise_error
      expect { raise 'oops' }.to raise_error(RuntimeError)
      expect { raise 'oops' }.to raise_error('oops')
      expect { raise 'oops' }.to raise_error(/op/)
      expect { raise 'oops' }.to raise_error(RuntimeError, 'oops')
      expect { raise 'oops' }.to raise_error(RuntimeError, /op/)
      expect { raise 'oops' }.to raise_error(
        an_instance_of(RuntimeError).and having_attributes(message: 'oops')
      )
    end

    it 'catch error' do
      def errFn(fn)
        begin
          method(fn).call
        rescue ZeroDivisionError
          'catch zero error'
          # rescue RuntimeError
          #   'catch runtime error'
        end
      end

      expect(
        errFn(
          def state
            1 / 0
          end
        )
      ).to eq 'catch zero error'
      expect {
        errFn(
          def err
            raise 'error'
          end
        )
      }.to raise_error
    end
  end

  context 'thread' do
    def testThread
      puts "start: #{Time.now}"
      thread1 =
        Thread.new do
          sum = 0
          1.upto(10) { |x| sum = sum + x }
          sleep(5)
          puts "sum: #{sum}, #{Time.now}"
        end
      thread2 =
        Thread.new do
          product = 0
          1.upto(10) { |x| product = product * x }
          sleep(3)
          puts "product: #{product}, #{Time.now}"
        end

      # thread1 and thread2 exec at the same time
      thread1.join
      thread2.join
      puts "end at #{Time.now}"
    end
    it 'should cal together' do
      expect(testThread).to be_falsy
    end

    it 'sync threads' do
      @monitor = Monitor.new
      @monitor.synchronize { testThread }
    end
  end

  context 'proc' do
    it 'works' do
      hello = lambda { 'hi' }
      expect(hello.call).to eq('hi')
    end

    it 'with params' do
      hello = lambda { |name| "hi, #{name}" }
      expect(hello.call('chris')).to eq 'hi, chris'
    end

    it 'call inside function' do
      def hello_bot
        hi = yield('chris')
        "#{hi}, what can I do for you?"
      end
      result = hello_bot { |name| "hi, #{name}" }
      expect(result).to eq('hi, chris, what can I do for you?')
    end

    it 'pass func as param' do
      def hello_bot(&hi)
        "#{hi.call('chris')}, what can I do for you?"
      end
      proc = lambda { |name| "hi, #{name}" }
      result = hello_bot(&proc)
      expect(result).to eq('hi, chris, what can I do for you?')
      # def hihi(name)
      #   "HiHi, #{name}"
      # end
      # expect(hello_bot(&hihi)).to eq('HiHi, chris, what can I do for ')
    end
  end
end
