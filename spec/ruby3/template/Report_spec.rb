require "ruby3/template/Report"
RSpec.describe Ruby3::Template do
  it 'display correct' do
    report = Ruby3::Template::Report.new
    expect(report.output_report).to eq('</head>')
  end
end
