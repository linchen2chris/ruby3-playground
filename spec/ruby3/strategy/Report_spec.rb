require 'ruby3/strategy/Report'

RSpec.describe do
  it 'display html correct' do
    report = Report.new &HTML_FORMATTER
    expect(report.output_report).to eq(
      '<html><head></head><title>monthly report</title><body><p>Things are going</p><p>really well</p></body></html>'
    )

    #  change strategy
    report.formatter = MD_FORMATTER
    expect(report.output_report).to eq(
      "#monthly report\nThings are going\nreally well\n"
    )
  end
  it 'display markdown correct' do
    mdReport = Report.new &MD_FORMATTER
    expect(mdReport.output_report).to eq(
      "#monthly report\nThings are going\nreally well\n"
    )
  end
  it 'display plaint correctly' do
    report =
      Report.new do |context|
        "#{context.title}: #{context.text.map { |x| x }.join}"
      end
    expect(report.output_report).to eq(
      'monthly report: Things are goingreally well'
    )
  end
end
