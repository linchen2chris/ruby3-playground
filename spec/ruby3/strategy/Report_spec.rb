require 'ruby3/strategy/Report'

RSpec.describe Ruby3::Strategy do
  it 'display html correct' do
    htmlFormatter = Ruby3::Strategy::HTMLFormatter.new
    report = Ruby3::Strategy::Report.new(htmlFormatter)
    expect(report.output_report).to eq(
      '<html><head></head><title>monthly report</title><body><p>Things are going</p><p>really well</p></body></html>'
    )

    #  change strategy
    report.formatter = Ruby3::Strategy::MDFormatter.new
    expect(report.output_report).to eq(
      "#monthly report\nThings are going\nreally well\n"
    )
  end
  it 'display markdown correct' do
    mdReport = Ruby3::Strategy::Report.new(Ruby3::Strategy::MDFormatter.new)
    expect(mdReport.output_report).to eq(
      "#monthly report\nThings are going\nreally well\n"
    )
  end
end
