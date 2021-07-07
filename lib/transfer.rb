class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount =amount
    @status = status
  end
  
  def valid?
    sender.valid? && receiver.valid? ? true : false
  end
  
  def execute_transaction
   if self.valid? == true && status == "pending"
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
  
  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end
  
  
end
