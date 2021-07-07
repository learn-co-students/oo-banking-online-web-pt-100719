class Transfer
  attr_reader :sender, :receiver, :status, :amount
  
  def initialize(acct1, acct2, amount)
    @sender = acct1
    @receiver = acct2
    @status = 'pending'
    @amount = amount 
  end 
  
  def valid?
    @sender.valid? && @receiver.valid?
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
    if @status == 'complete' 
      @sender.balance += @amount 
      @receiver.balance -= @amount 
      @status = 'reversed'
    end 
  end 
  
end
