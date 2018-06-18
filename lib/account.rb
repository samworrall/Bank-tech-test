require_relative 'transaction'
class Account
  MINIMUM_BALANCE = 0
  MINIMUM_DEPOSIT = 0
  MINIMUM_WITHDRAWAL = 0
  attr_reader :balance

  def initialize(transaction = Transaction.new)
    @balance = MINIMUM_BALANCE
    @transaction = transaction
  end

  def deposit(amount)
    raise "Minimum deposit is #{MINIMUM_DEPOSIT}" if amount < MINIMUM_DEPOSIT
    @balance += amount
    @transaction.log(amount, 0, @balance)
  end

  def withdraw(amount)
    raise "Minimum withdrawal is #{MINIMUM_WITHDRAWAL}" if amount < MINIMUM_WITHDRAWAL
    raise 'Insufficient funds!' if @balance - amount < MINIMUM_BALANCE
    @balance -= amount
    @transaction.log(0, amount, @balance)
  end

  def view_statement
    @transaction.print_transaction_history
  end
end
