require 'forwardable'

class Writer
  def initialize(text)
    @text = text
  end

  def write_line
    "#{@text}\n"
  end

  def append(new_text)
    @text = "#{@text}#{new_text}"
  end
end

class WriterDecorator
  extend Forwardable

  def_delegators :@real_writer, :write_line, :append

  def initialize(writer)
    @real_writer = writer
  end
end

class PrefixDecorator < WriterDecorator
  def write_line
    "prefix: #{@real_writer.write_line}"
  end
end

class SuffixDecractor < WriterDecorator
  def write_line
    "#{@real_writer.write_line} suffix"
  end
end
