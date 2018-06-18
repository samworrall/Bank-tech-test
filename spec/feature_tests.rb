require_relative '../lib/account.rb'
require_relative '../lib/transaction.rb'

def make_a_deposit
  account = Account.new
  account.deposit(100)
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
