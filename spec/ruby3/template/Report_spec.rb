require 'ruby3/template/Report'
RSpec.describe Ruby3::Template do
  it 'display html correct' do
    report = Ruby3::Template::HTMLReport.new
    expect(report.output_report).to eq(
      '<html><head></head><title>monthly report</title><body><p>Things are going</p><p>really well</p></body></html>'
    )
  end
  it 'display markdown correct' do
    mdReport = Ruby3::Template::MarkDownReport.new
    expect(mdReport.output_report).to eq(
      "#monthly report\nThings are going\nreally well\n"
    )
  end
  it 'test' do
    expect(1 + 1).to be 2
  end
end
