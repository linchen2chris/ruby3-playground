class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(formatter)
    @title = 'monthly report'
    @text = ['Things are going', 'really well']
    @formatter = formatter
  end

  def output_report
    @formatter.output(self)
  end
end
