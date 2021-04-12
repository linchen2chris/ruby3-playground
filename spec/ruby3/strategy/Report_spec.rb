require 'ruby3/strategy/Report'
require 'ruby3/strategy/HTMLFormatter'
require 'ruby3/strategy/MDFormatter'

RSpec.describe do
  it 'display html correct' do
    htmlFormatter = HTMLFormatter.new
    report = Report.new(htmlFormatter)
    expect(report.output_report).to eq(
      '<html><head></head><title>monthly report</title><body><p>Things are going</p><p>really well</p></body></html>'
    )

    #  change strategy
    report.formatter = MDFormatter.new
    expect(report.output_report).to eq(
      "#monthly report\nThings are going\nreally well\n"
    )
  end
  it 'display markdown correct' do
    mdReport = Report.new(MDFormatter.new)
    expect(mdReport.output_report).to eq(
      "#monthly report\nThings are going\nreally well\n"
    )
  end
end
