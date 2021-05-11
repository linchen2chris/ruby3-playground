require 'find'

class Express
end

class All < Express
  def evaluate(dir)
    results = []
    Find.find(dir) do |p|
      next unless File.file?(p)
      results << p
    end
    results
  end
end

class Bigger < Express
  def initialize(size)
    @size = size
  end
  def evaluate(dir)
    results = []
    Find.find(dir) do |p|
      next unless File.file?(p)
      results << p if (File.size(p) > @size)
    end
    results
  end
end

class And < Express
  def initialize(exp1, exp2)
    @exp1 = exp1
    @exp2 = exp2
  end

  def evaluate(dir)
    result1 = @exp1.evaluate(dir)
    result2 = @exp2.evaluate(dir)
    (result1 & result2)
  end
end
