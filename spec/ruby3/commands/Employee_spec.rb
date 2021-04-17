require 'ruby3/commands/Employee'
require 'madeleine'

RSpec.describe do
  it 'record add' do
    store = SnapshotMadeleine.new(employees) { EmployeeManager.new }
    tom = Employee.new('tom', 1)
    jack = Employee.new('jack', 2)
    store.execute_command(AddEmployee.new tom)
    store.execute_command(AddEmployee.new jack)
    puts(store.execute_command(FindEmployee.new 1))
  end
end
