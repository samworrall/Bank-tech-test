class Transaction
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

  def print_transaction_history
    statement = "Date || Credit || Debit || Balance\n"
    @history.reverse.each do |transaction|
      statement += "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}\n"
    end
    p statement
  end
end
