require_relative 'transaction_log'
class Account
  MINIMUM_BALANCE = 0
  MINIMUM_DEPOSIT = 0
  MINIMUM_WITHDRAWAL = 0
  attr_reader :balance

  def initialize(transaction_log = Transaction_log.new, printer = Printer.new)
    @balance = MINIMUM_BALANCE
    @transaction_log = transaction_log
    @printer = printer
  end

  def deposit(amount)
    raise "Minimum deposit is #{MINIMUM_DEPOSIT}" if amount < MINIMUM_DEPOSIT
    @balance += amount
    @transaction_log.log(Time.now.strftime('%d/%m/%Y'), amount, 0, @balance)
  end

  def withdraw(amount)
    raise "Minimum withdrawal is #{MINIMUM_WITHDRAWAL}" if amount < MINIMUM_WITHDRAWAL
    raise 'Insufficient funds!' if @balance - amount < MINIMUM_BALANCE
    @balance -= amount
    @transaction_log.log(Time.now.strftime('%d/%m/%Y'), 0, amount, @balance)
  end

  def view_statement
    @printer.pretty_print(@transaction_log.history)
  end
end
