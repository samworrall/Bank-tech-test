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

  it 'Raises an error' do
    account = Account.new
    date = Time.now.strftime('%d/%m/%Y')
    expect { account.withdraw(50) }.to raise_error(
      "Insufficient funds!"
    )
  end
end
