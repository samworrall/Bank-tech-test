require 'printer'

describe Printer do
  let(:statement) {
    [{ date: '18/06/2018', credit: 20, debit: 0, balance: 20 },
     { date: '18/06/2018', credit: 0, debit: 10, balance: 10 }] }

  describe '#pretty_print', :pretty_print do
    it 'Takes 1 argument' do
      expect(subject).to respond_to(:pretty_print).with(1).arguments
    end

    it 'Pretty prints a statement' do
      expect(subject.pretty_print(statement)).to eq("Date || Credit || Debit || Balance\n18/06/2018 || 0 || 10 || 10\n18/06/2018 || 20 || 0 || 20\n")
    end
  end
end
