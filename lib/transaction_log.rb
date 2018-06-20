class Transaction_log
  attr_reader :history

  def initialize
    @history = []
  end

  def log(date, credit, debit, balance)
    @history.push(date: date,
                  credit: credit,
                  debit: debit,
                  balance: balance)
  end
end
