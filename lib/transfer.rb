class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end
  
  def valid?
    if @sender.valid? && @receiver.valid?
      true
    end
  end
  
  def execute_transaction
    if @status == 'pending' && self.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'complete'
    else 
      @sender.close_account
      @status = 'rejected'
      p "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.execute_transaction
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed'
    end
  end
  
end
