class Transaction
  attr_reader :date, :debit, :credit
  def initialize(date, debit, credit, balance)
    @date = date
    @debit = debit
    @credit = credit
  end
end
