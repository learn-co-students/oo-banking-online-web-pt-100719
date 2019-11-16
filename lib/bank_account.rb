class BankAccount
	attr_accessor :status, :balance
	attr_reader :name

	@@all = []

	def initialize(name)
		@name = name
		@status = "open"
		@balance = 1000
	end

	def all
		@@all
	end

	def deposit(amount)
		self.balance += amount
	end
	
	def display_balance
		"Your balance is $#{balance}."
	end

	def valid?
		if self.status == "open" && self.balance > 0
			return true
		else
			return false
		end
	end

	def close_account
		self.status = "closed"
	end

end
