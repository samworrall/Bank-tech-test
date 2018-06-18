require 'spec_helper.rb'
require 'account'

describe Account do
  describe '#balance', :balance do
    it 'Returns the balance of the account' do
      expect(subject.balance).to eq(0)
    end
  end
end
