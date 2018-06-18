class Transaction
  attr_reader :date
  def initialize(date, debit, credit, balance)
    @date = date
  end
end
