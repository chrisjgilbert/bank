class Account
  DEFAULT_BALANCE = 0

  attr_reader :balance, :transactions

  def initialize(statement = Statement.new)
    @balance = DEFAULT_BALANCE
    @transactions = []
    @statment = statement
  end

  def deposit(amount)
    @balance += amount
    add_to_transactions(
      {
        date: "01/10/14",
        type: :debit,
        amount: amount,
        balance: @balance
      }
    )
  end

  def withdraw(amount)
    raise_insufficient_funds_error if insufficient_funds?(amount)

    @balance -= amount
    add_to_transactions(
      {
        date: "01/10/14",
        type: :debit,
        amount: amount,
        balance: @balance
      }
    )
  end

  def print_statement
    @statment.print(@transactions)
  end

  private

  def insufficient_funds?(amount)
    @balance - amount < 0
  end

  def raise_insufficient_funds_error
    raise 'Unable to withdraw: insufficient funds!'
  end

  def add_to_transactions(transaction)
    @transactions.push(transaction)
  end
end
