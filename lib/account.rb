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
    if insufficient_funds?(amount)
      raise 'Unable to withdraw: insufficient funds!'
    else
      @balance -= amount
    end
  end

  private

  def insufficient_funds?(amount)
    @balance - amount < 0
  end
end
