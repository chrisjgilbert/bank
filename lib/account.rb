require_relative './date_formatter'
require_relative './statement'

class Account
  DEFAULT_BALANCE = 0

  attr_reader :balance, :transactions

  def initialize(statement = Statement.new, date_formatter = DateFormatter.new)
    @balance = DEFAULT_BALANCE
    @transactions = []
    @statment = statement
    @date_formatter = date_formatter
  end

  def deposit(amount)
    credit(amount)
    add_to_transactions(
      date: @date_formatter.get_date,
      credit: amount,
      balance: @balance
    )
  end

  def withdraw(amount)
    raise_insufficient_funds_error if insufficient_funds?(amount)

    debit(amount)
    add_to_transactions(
      date: @date_formatter.get_date,
      debit: amount,
      balance: @balance
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

  def debit(amount)
    @balance -= amount
  end

  def credit(amount)
    @balance += amount
  end
end
