class Account
  MINIMUM_BALANCE = 0
  attr_reader :balance, :transaction_history

  def initialize
    @balance = MINIMUM_BALANCE
    @transaction_history = []
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise 'Insufficient funds!' if @balance - amount < MINIMUM_BALANCE
    @balance -= amount
  end
end
