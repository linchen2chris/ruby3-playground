require 'ruby3/template/Report'
RSpec.describe Ruby3::Template do
  it 'display correct' do
    report = Ruby3::Template::Report.new
    expect(report.output_report).to eq(
      '<html> <head> <title>monthly report</title> <body> <p>Things are going</p> <p>really well</p> </body> </head> </html>'
    )
  end
end
