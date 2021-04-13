require 'ruby3/observer/Employee'

RSpec.describe do
  it 'should get notify' do
    employee = Employee.new('chris', 'senior Dev', 10)
    taxman = TaxMan.new
    payroll = Payroll.new
    employee.add_observer(taxman)
    employee.add_observer(payroll)
    employee.salary = 20
  end
end
