require 'ruby3/proxy/BankAccount'

RSpec.describe do
  context 'bankaccount works' do
    account = Bankaccount.new(12)

    it 'withDraw' do
      account.withdraw(10)
      expect(account.balance).to be(2)
    end
    it 'deposit' do
      # account的值被上个测试影响
      expect(account.balance).to be(2)
      account.deposit(20)
      expect(account.balance).to be(22)
    end
  end

  context 'bank account proxy' do
    proxy = BankAccountProxy.new { Bankaccount.new(12) }
    it 'withdraw' do
      proxy.withdraw(10)
      expect(proxy.balance).to be(2)
    end
    it 'deposit' do
      proxy.deposit(11)
      expect(proxy.balance).to be(13)
    end
  end
end
