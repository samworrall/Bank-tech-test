require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new('18/06/2018', 0, 10, 10) }
  describe '#date' do
    it 'Returns the date of the transaction' do
      expect(transaction.date).to eq('18/06/2018')
    end
  end
end
