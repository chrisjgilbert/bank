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
      date = (transaction[:date])
      credit = number_formatter(transaction[:credit])
      debit = number_formatter(transaction[:debit])
      balance = number_formatter(transaction[:balance])
      puts "#{date} || #{credit} || #{debit} || #{balance}"
    end
  end

  def number_formatter(number)
    '%.2f' % number if number 
  end
end
