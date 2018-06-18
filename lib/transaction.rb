class Transaction
  attr_reader :history

  def initialize
    @history = []
  end

  def log(debit, credit, balance)
    @history.push(date: Time.now.strftime("%d/%m/%Y"), debit: debit, credit: credit, balance: balance)
  end
end
