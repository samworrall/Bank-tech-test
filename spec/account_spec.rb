require 'account'
require 'transaction'

describe Account do
  let(:subject) { Account.new(transaction) }
  let(:transaction) { spy :transaction }

  describe '#balance', :balance do
    it 'Begins empty' do
      expect(subject.balance).to eq(Account::MINIMUM_BALANCE)
    end

    it 'Returns the balance of the account' do
      expect(subject.balance).to eq(Account::MINIMUM_BALANCE)
    end
  end

  describe '#deposit', :deposit do
    it 'Increases the account balance by 10' do
      subject.deposit(10)
      expect(subject.balance).to eq(10)
    end

    it 'Calls log on transaction' do
      subject.deposit(10)
      expect(transaction).to have_received(:log).once
    end
  end

  describe '#withdraw', :withdraw do
    it 'Decreases the account balance by 10' do
      subject.deposit(20)
      subject.withdraw(10)
      expect(subject.balance).to eq(10)
    end

    it 'Calls log on transaction' do
      subject.deposit(20)
      subject.withdraw(10)
      expect(transaction).to have_received(:log).twice
    end

    it 'Raises an error when new balance would be < minimum balace' do
      expect { subject.withdraw(1) }.to raise_error('Insufficient funds!')
    end
  end
end
