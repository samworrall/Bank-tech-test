require_relative '../lib/account.rb'
require_relative '../lib/transaction_log.rb'
require_relative '../lib/printer.rb'

def make_a_deposit
  account = Account.new
  account.deposit(100)
end

def deposit_a_negative_amount
  account = Account.new
  account.deposit(-50)
end

def make_a_withdrawal
  account = Account.new
  account.deposit(100)
  account.withdraw(50)
end

def withdraw_too_much
  account = Account.new
  account.deposit(50)
  account.withdraw(100)
end

def withdraw_a_negative_amount
  account = Account.new
  account.deposit(50)
  account.withdraw(-50)
end

def check_balance
  account = Account.new
  account.deposit(50)
  account.balance
end

def view_transaction_statement
  account = Account.new
  account.deposit(50)
  account.deposit(100)
  account.withdraw(50)
  account.view_statement
end
