require 'spec_helper.rb'
require 'account'

describe Account do
  describe '#balance', :balance do
    it 'Begins empty' do
      expect(subject.balance).to eq(0)
    end

    it 'Returns the balance of the account' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#deposit', :deposit do
    it 'Increases the account balance by 10' do
      subject.deposit(10)
      expect(subject.balance).to eq(10)
    end
  end
end
