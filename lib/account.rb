class Account
  MINIMUM_BALANCE = 0
  attr_reader :balance, :transaction_history

  def initialize
    @balance = MINIMUM_BALANCE
    @transaction_history = []
  end

  def deposit(amount)
    @balance += amount
    @transaction_history.push(date: Time.now.strftime('%d/%m/%Y'),
                              debit: 0, credit: amount, balance: @balance)
  end

  def withdraw(amount)
    raise 'Insufficient funds!' if @balance - amount < MINIMUM_BALANCE
    @balance -= amount
  end
end
