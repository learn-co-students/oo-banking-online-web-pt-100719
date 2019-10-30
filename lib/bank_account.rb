class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(deposit)
    @balance += deposit
  end

  def display_balance
    p "Your balance is $#{self.balance}."
  end

  def valid?
    self.balance > 0 && self.status == "open"
  end

  def close_account
    @status = "closed"
  end
end
