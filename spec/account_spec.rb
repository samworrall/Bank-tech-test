require 'account'

describe Account do
  let(:subject) { Account.new(transaction, printer) }
  let(:transaction) { spy :transaction }
  let(:printer) {
     double :printer,
     pretty_print: <<~HEREDOC
     Date || Credit || Debit || Balance
     18/06/2018 || 0 || 10 || 10
     18/06/2018 || 20 || 0 || 20
     HEREDOC
   }
  describe '#balance', :balance do
    it 'Begins empty' do
      expect(subject.balance).to eq(Account::MINIMUM_BALANCE)
    end

    it 'Returns the balance of the account' do
      expect(subject.balance).to eq(Account::MINIMUM_BALANCE)
    end
  end

  describe '#deposit', :deposit do
    it 'Takes one argument' do
      expect(subject).to respond_to(:deposit).with(1).argument
    end

    it 'Increases the account balance by 10' do
      expect { subject.deposit(10) }.to change { subject.balance }.by(10)
    end

    it 'Calls log on transaction' do
      subject.deposit(10)
      expect(transaction).to have_received(:log).once
    end

    it 'Raises an error if the deposit amount is negative' do
      subject.deposit(10)
      expect { subject.deposit(-10) }.to raise_error('Minimum deposit is 0')
    end
  end

  describe '#withdraw', :withdraw do
    it 'Takes one argument' do
      expect(subject).to respond_to(:withdraw).with(1).argument
    end

    it 'Decreases the account balance by 10' do
      subject.deposit(20)
      subject.withdraw(10)
      expect { subject.withdraw(10) }.to change{ subject.balance }.by -10
    end

    it 'Calls log on transaction' do
      subject.deposit(20)
      subject.withdraw(10)
      expect(transaction).to have_received(:log).twice
    end

    it 'Raises an error when new balance would be < minimum balace' do
      expect { subject.withdraw(10) }.to raise_error('Insufficient funds!')
    end

    it 'Raises an error if the withdrawal amount is negative' do
      subject.deposit(10)
      expect { subject.withdraw(-10) }.to raise_error('Minimum withdrawal is 0')
    end
  end

  describe '#view_statement', :view_statement do
    it 'Returns a full transaction statement' do
      subject.deposit(20)
      subject.withdraw(10)
      expect(subject.view_statement).to eq(
        <<~HEREDOC
        Date || Credit || Debit || Balance
        18/06/2018 || 0 || 10 || 10
        18/06/2018 || 20 || 0 || 20
        HEREDOC
      )
    end
  end
end
