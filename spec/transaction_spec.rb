require 'transaction'

describe Transaction do
  describe '#history', :history do
    it 'Returns an empty array upon instantiation' do
      expect(subject.history).to eq([])
    end
  end

  describe '#log', :log do
    it 'Pushes a credit log to the history array' do
      subject.log(10, 0, 10)
      expect(subject.history).to eq([{
        date: '18/06/2018', credit: 10, debit: 0, balance: 10
                                    }])
    end

    it 'Pushes a debit log to the history array' do
      subject.log(0, 10, 10)
      expect(subject.history).to eq([{
        date: '18/06/2018', credit: 0, debit: 10, balance: 10
                                    }])
    end
  end

  describe '#print_transaction_history', :print_history do
    it 'Prints the entire transaction history' do
      subject.log(20, 0, 20)
      subject.log(0, 10, 10)
      expect(subject.print_transaction_history).to eq("Date || Credit || Debit || Balance\n18/06/2018 || 0 || 10 || 10\n18/06/2018 || 20 || 0 || 20\n")
    end
  end
end
