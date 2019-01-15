class Statement
  def print(transactions)
    print_header
    print_transactions(transactions)
  end

  private

  def print_header
    puts "date || credit || debit || balance"
  end

  def print_transactions(transactions)
    transactions.each do |transaction|
      date = transaction[:date]
      credit = transaction[:credit]
      debit = transaction[:debit]
      balance = transaction[:balance]
      puts "#{date} || #{credit} || #{debit} || #{balance}"
    end
  end
end
