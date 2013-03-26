class SecretNumber
	attr_reader  :set_of_numbers, :secret_number

	def initialize(range = 1...10)
		
		@set_of_numbers = range
		@secret_number = generate_secret_number
	end
	private

	def generate_secret_number
		set_of_numbers.to_a.sample
	end
end	