class Bankaccount
  attr_reader :balance

  def initialize(init_balance)
    @balance = init_balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end

class BankAccountProxy
  def initialize(&create_object)
    @creation = create_object
  end

  def method_missing(name, *args)
    s = subject
    s.send(name, *args)
  end

  def subject
    @subject || (@subject = @creation.call)
  end
end
