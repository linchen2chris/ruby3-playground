class MyArray
  attr_accessor :data

  include Enumerable

  def initialize(data)
    @data = data
  end

  def each(&block)
    @data.each(&block)
  end

  def my_map
    i = 0
    result = []
    while i < @data.length
      result << yield(@data[i])
      i += 1
    end
    return result
  end
end
