require 'printer'

describe Printer do
  describe '#pretty_print', :pretty_print do
    it 'Takes 1 argument' do
      expect(subject).to respond_to(:pretty_print).with(1).arguments
    end
  end
end
