class Transaction
  attr_reader :date, :debit
  def initialize(date, debit, credit, balance)
    @date = date
    @debit = debit
  end
end
