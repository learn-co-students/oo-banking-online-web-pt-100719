class Transfer
    attr_reader :sender, :receiver, :amount
    attr_accessor :status

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      return true
    end
  end

  def execute_transaction
    if valid? && sender.balance > amount && @status == "pending"
      receiver.balance = receiver.balance + amount
      sender.balance = sender.balance - amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && sender.balance > amount && @status == "complete"
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
      @status = "reversed"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end
