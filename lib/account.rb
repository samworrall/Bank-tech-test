class Account
  MINIMUM_BALANCE = 0
  attr_reader :balance, :transaction_history

  def initialize
    @balance = MINIMUM_BALANCE
    @transaction_history = []
  end

  def deposit(amount)
    @balance += amount
    @transaction_history.push(Transaction.new(Time.now.strftime('%d/%m/%Y'), 0, amount, @balance))
  end

  def withdraw(amount)
    raise 'Insufficient funds!' if @balance - amount < MINIMUM_BALANCE
    @balance -= amount
    @transaction_history.push(Transaction.new(Time.now.strftime('%d/%m/%Y'), amount, 0, @balance))
  end
end
