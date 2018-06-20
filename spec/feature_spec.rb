require_relative '../lib/account.rb'
require_relative '../lib/transaction_log.rb'
require_relative '../lib/printer.rb'

describe 'Bank Account', :feature do

  it 'Prints the desired statement' do
    account = Account.new
    date = Time.now.strftime('%d/%m/%Y')
    account.deposit(50)
    account.deposit(50)
    account.withdraw(50)
    expect { account.view_statement }.to output(
      <<~HEREDOC
      Date || Credit || Debit || Balance
      #{date} || 0 || 50 || 50
      #{date} || 50 || 0 || 100
      #{date} || 50 || 0 || 50\n
      HEREDOC
    ).to_stdout
  end

  it 'Raises an error when withdrawing more than is in balance' do
    account = Account.new
    date = Time.now.strftime('%d/%m/%Y')
    expect { account.withdraw(50) }.to raise_error(
      "Insufficient funds!"
    )
  end

  it 'Raises an error when withdrawing less than the minimum withdrawal' do
    account = Account.new
    date = Time.now.strftime('%d/%m/%Y')
    expect { account.withdraw(-50) }.to raise_error(
      "Minimum withdrawal is #{Account::MINIMUM_WITHDRAWAL}"
    )
  end

  it 'Raises an error when depositing less than the minimum deposit' do
    account = Account.new
    date = Time.now.strftime('%d/%m/%Y')
    expect { account.deposit(-50) }.to raise_error(
      "Minimum deposit is #{Account::MINIMUM_DEPOSIT}"
    )
  end

  it 'Updates the balance of the account positively' do
    account = Account.new
    expect { account.deposit(50) }.to change { account.balance }.by(50)
  end

  it 'Updates the balance of the account negatively' do
    account = Account.new
    account.deposit(100)
    expect { account.withdraw(50) }.to change { account.balance }.by(-50)
  end
end
