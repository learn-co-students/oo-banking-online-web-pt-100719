class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(account_name)
    @name = account_name
    @balance = 1000
    @status = "open" # When an account is created, it is considered to be open
  end

  # Instance method we use when depositing money
  def deposit(money)
    @balance = @balance + money #=> 1000 + $$$
  end

  # Displays the balance currently within our account
  def display_balance
    "Your balance is $#{@balance}."
  end

  # Determines if account is valid
  # To be valid, the status must be open and the balance greater than zero
  def valid?
    @status == "open" && @balance > 0 ? true : false
  end

  def close_account
    @status = "closed"
  end

end
