class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(&formatter)
    @title = 'monthly report'
    @text = ['Things are going', 'really well']
    @formatter = formatter
  end

  def output_report
    @formatter.call(self)
  end
end

HTML_FORMATTER =
  lambda do |context|
    "<html><head></head><title>#{context.title}</title><body>#{context.text.map do |line|
                                                                 "<p>#{line}</p>"
                                                               end.join}</body></html>"
  end
MD_FORMATTER =
  lambda do |context|
    "##{context.title}\n#{context.text.map { |line| "#{line}\n" }.join}"
  end
