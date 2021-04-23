require 'ruby3/singleton/DBConnection'
RSpec.describe do
  it 'only one class' do
    conn1 = Dbconnection.instance
    conn2 = Dbconnection.instance
    expect(conn1.plus).to be 2
    expect(conn1.plus).to be 3
    expect(conn2.plus).to be 4
  end
end
