class Account
  MINIMUM_BALANCE = 0
  attr_reader :balance

  def initialize
    @balance = MINIMUM_BALANCE
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    if @balance - amount < MINIMUM_BALANCE
      fail 'You have insufficient funds!'
    else
      @balance -= amount
    end
  end

end
