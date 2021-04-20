require 'ruby3/commands/EmployeeCommand'

RSpec.describe do
  it 'record add' do
    store = SnapshotMadeleine.new('employees') { EmployeeManager.new }
    tom = Employee2.new('tom', 1)
    jack = Employee2.new('jack', 2)
    store.execute_command(AddEmployee.new(tom))
    store.execute_command(AddEmployee.new(jack))
    puts(store.execute_command(FindEmployee.new(1)))
    puts(store.execute_command(FindEmployee.new(2)))
  end
end
