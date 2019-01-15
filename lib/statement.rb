class Statement

  def print(transactions)
    transactions.each do |transaction|
      puts "Date: #{transaction[:date]} || #{transaction[:type]}: #{transaction[:amount]} || Balance: #{transaction[:balance]}"
    end
  end

end
