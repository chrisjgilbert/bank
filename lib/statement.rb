class Statement
  def print(transactions)
    print_header
    transactions.each do |transaction|
      date = transaction[:date]
      credit = transaction[:credit]
      debit = transaction[:debit]
      balance = transaction[:balance]
      puts "#{date} || #{credit} || #{debit} || #{balance}"
    end
  end

  private

  def print_header
    puts "date || credit || debit || balance"
  end
end
