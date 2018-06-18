class Account
  MINIMUM_BALANCE = 0
  attr_reader :balance

  def initialize(transaction)
    @balance = MINIMUM_BALANCE
    @transaction = transaction
  end

  def deposit(amount)
    @balance += amount
    @transaction.log(amount, 0, @balance)
  end

  def withdraw(amount)
    raise 'Insufficient funds!' if @balance - amount < MINIMUM_BALANCE
    @balance -= amount
    @transaction.log(0, amount, @balance)
  end
end
