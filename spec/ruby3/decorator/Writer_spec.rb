require 'ruby3/decorator/Writer'

RSpec.describe do
  context 'writer_decorator works' do
    writer = Writer.new('some text')
    writer_deco = WriterDecorator.new(writer)

    it 'writes correctly' do
      expect(writer_deco.write_line).to eql "some text\n"
    end
    it 'append correctly' do
      writer_deco.append 'feet'
      expect(writer_deco.write_line).to eql "some textfeet\n"
    end
  end
  context 'lineNumber decor works' do
    writer = Writer.new('some text')
    prefix_deco = PrefixDecorator.new(writer)
    it 'writes correctly' do
      expect(prefix_deco.write_line).to eql "prefix: some text\n"
    end
  end

  context 'suffix deco works' do
    writer = Writer.new('some text')
    suffix_deco = SuffixDecractor.new(writer)
    it 'works' do
      expect(suffix_deco.write_line).to eql "some text\n suffix"
    end
  end

  context 'combine' do
    writer = Writer.new('some text')
    prefix_deco = PrefixDecorator.new(writer)
    prefix_suffix_deco = SuffixDecractor.new(prefix_deco)
    it 'works' do
      expect(prefix_suffix_deco.write_line).to eql "prefix: some text\n suffix"
    end
  end
end
