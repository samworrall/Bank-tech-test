require 'transaction'

describe Transaction do
  let(:date) { '18/06/2018' }
  describe '#history', :history do
    it 'Returns an empty array upon instantiation' do
      expect(subject.history).to eq([])
    end
  end

  describe '#log', :log do
    it 'Takes 4 arguments' do
      expect(subject).to respond_to(:log).with(4).arguments
    end

    it 'Increases the history array length by 1' do
      expect { subject.log(date, 10, 0, 10) }.to change { subject.history.length }.by(1)
    end

    it 'Pushes a credit log to the history array' do
      subject.log(date, 10, 0, 10)
      expect(subject.history).to eq([{
        date: '18/06/2018', credit: 10, debit: 0, balance: 10
                                    }])
    end

    it 'Pushes a debit log to the history array' do
      subject.log(date, 0, 10, 10)
      expect(subject.history).to eq([{
        date: '18/06/2018', credit: 0, debit: 10, balance: 10
                                    }])
    end
  end

  describe '#print_transaction_history', :print_history do
    it 'Prints the entire transaction history' do
      subject.log(date, 20, 0, 20)
      subject.log(date, 0, 10, 10)
      expect(subject.print_transaction_history).to eq("Date || Credit || Debit || Balance\n18/06/2018 || 0 || 10 || 10\n18/06/2018 || 20 || 0 || 20\n")
    end
  end
end
