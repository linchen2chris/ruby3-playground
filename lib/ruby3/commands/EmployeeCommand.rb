# require 'rubygems'
require 'madeleine'

class Employee2
  attr_accessor :name, :number

  def initialize(name, number)
    @name = name
    @number = number
  end
  def to_s()
    "name: #{@name}, number: #{@number}"
  end
end

class EmployeeManager
  def initialize()
    @employees = []
  end
  def add_employee(e)
    @employees[e.number] = e
  end
  def remove(number)
    @employees.remove(number)
  end
  def find(number)
    @employees[number]
  end
end

class AddEmployee
  def initialize(employee)
    @employee = employee
  end

  def execute(system)
    system.add_employee(@employee)
  end
end

class DeleteEmployee
  def initialize(employee)
    @employee = employee
  end

  def execute(system)
    system.remove(@employee)
  end
end

class FindEmployee
  def initialize(number)
    @number = number
  end
  def execute(system)
    system.find(@number)
  end
end
