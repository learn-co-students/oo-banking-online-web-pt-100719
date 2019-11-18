class Transfer

  require 'pry'

  attr_accessor :sender, :receiver, :amount, :status

  # Each transfer MUST have a sender, receiver and amount
  # Each instance also has a default status of "pending"
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  # Checks to see if the sender and receiver have valid accounts
  # Both MUST be valid
  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if valid? && status == "pending"
      if amount < self.sender.balance
        self.sender.balance -= amount
        self.receiver.balance += amount
        self.status = "complete"
      else
         self.status = "rejected"
         "Transaction rejected. Please check your account balance."
      end
    else
       self.status = "rejected"
       "Transaction rejected. Please check your account balance."
    end
  end

  # Reverses a completed transfer
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount # Refunds the sender
      @receiver.balance -= @amount # Takes from the original receiver
      @status = "reversed" # Transaction is complete
    end
  end

end
