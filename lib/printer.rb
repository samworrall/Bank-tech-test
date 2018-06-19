class Printer
  def pretty_print(statement)
    printed_statement = "Date || Credit || Debit || Balance\n"
    statement.reverse.each do |transaction|
      printed_statement += "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}\n"
    end
    p printed_statement
  end
end
