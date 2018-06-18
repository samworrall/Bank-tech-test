class Account
  MINIMUM_BALANCE = 0
  attr_reader :balance

  def initialize
    @balance = MINIMUM_BALANCE
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end
