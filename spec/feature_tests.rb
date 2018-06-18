require_relative '../lib/account.rb'
require_relative '../lib/transaction.rb'

def make_a_deposit
  account = Account.new
  account.deposit(100)
end
