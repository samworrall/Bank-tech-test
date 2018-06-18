require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new('18/06/2018', 0, 10, 10) }

  describe '#date', :date do
    it 'Returns the date of the transaction' do
      expect(transaction.date).to eq('18/06/2018')
    end
  end

  describe '#debit', :debit do
    it 'Returns the debit value of the transaction' do
      expect(transaction.debit).to eq(0)
    end
  end

  describe '#credit', :credit do
    it 'Returns the credit value of the transaction' do
      expect(transaction.credit).to eq(10)
    end
  end

  describe '#balance', :balance do
    it 'Returns the balance after the transaction' do
      expect(transaction.balance).to eq(10)
    end
  end
end
