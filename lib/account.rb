class Account
  DEFAULT_BALANCE = 0

  attr_reader :balance

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise_insufficient_funds_error if insufficient_funds?(amount)

    @balance -= amount
  end

  private

  def insufficient_funds?(amount)
    @balance - amount < 0
  end

  def raise_insufficient_funds_error
    raise 'Unable to withdraw: insufficient funds!'
  end
end
