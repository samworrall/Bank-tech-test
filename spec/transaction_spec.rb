require 'transaction'

describe Transaction do

  describe '#history', :history do
    it 'Returns an empty array upon instantiation' do
      expect(subject.history).to eq([])
    end
  end
end
