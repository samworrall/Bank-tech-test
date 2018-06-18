# require_relative 'transaction.rb'

class Account
  MINIMUM_BALANCE = 0
  attr_reader :balance, :transaction_history

  def initialize
    @balance = MINIMUM_BALANCE
    @transaction_history = []
  end

  def deposit(amount)
    @balance += amount
    @transaction_history.push(amount)
  end

  def withdraw(amount)
    raise 'Insufficient funds!' if @balance - amount < MINIMUM_BALANCE
    @balance -= amount
    @transaction_history.push(amount)
  end

  def statement
    statement = ''
    @transaction_history.each_with_index do |transaction, i|
      statement += "#{i + 1}. #{transaction.date}, #{transaction.debit}, #{transaction.credit}, #{transaction.balance}\n"
    end
    statement
  end
end
