require 'transaction'

describe Transaction do
  describe '#history', :history do
    it 'Returns an empty array upon instantiation' do
      expect(subject.history).to eq([])
    end
  end

  describe '#log', :log do
    it 'Pushes a credit log to the history array' do
      subject.log(0, 10, 10)
      expect(subject.history).to eq([{
        date: '18/06/2018', debit: 0, credit: 10, balance: 10
                                    }])
    end

    it 'Pushes a debit log to the history array' do
      subject.log(10, 0, 10)
      expect(subject.history).to eq([{
        date: '18/06/2018', debit: 10, credit: 0, balance: 10
                                    }])
    end
  end
end
