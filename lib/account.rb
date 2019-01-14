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
    if @balance - amount < 0
      raise 'Unable to withdraw: insufficient funds!'
    else
      @balance -= amount
    end
  end
end
