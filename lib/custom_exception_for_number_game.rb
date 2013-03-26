class CustomException < StandardError
	attr_reader :exception_message
	def initialize(exception_message = "Sorry, we didn't understand your input. Try again.")
		super(exception_message)
	end

	
end	