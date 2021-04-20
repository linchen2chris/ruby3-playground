require 'observer'
class Employee
  include Observable

  attr_reader :name
  attr_accessor :title, :salary

  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
  end

  def register(observer)
    add_observer(observer)
  end

  def salary=(new_salary)
    @salary = new_salary
    changed
    notify_observers(self)
  end
end

class Payroll
  def update(changed_employee)
    puts "#{changed_employee.name} new salary is #{changed_employee.salary}"
  end
end

class TaxMan
  def update(changed_employee)
    puts "#{changed_employee.name} new salary is #{changed_employee.salary}"
  end
end
