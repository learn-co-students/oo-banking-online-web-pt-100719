class BankAccount
    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name)
        @name = name
        @status = "open"
        @balance = 1000
    end

    def deposit(transfer_amt)
        @balance = @balance + transfer_amt
    end

    def display_balance
        "Your balance is $#{balance}."
    end

    def valid?
        if @balance > 0 && @status == "open"
            return true
        else
            return false
        end
    end

    def close_account
        @status = "closed"
    end

end
