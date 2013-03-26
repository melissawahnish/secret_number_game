class Game
	attr_reader :guesses_allowed, :current_guess_count, :secret_number, :player_name
	def initialize(guesses = 3, set_of_numbers = 0..10) 
			@guesses_allowed = guesses
		@current_guess_count = 0 
		@player = Player.new(player_name)
		@secret_number = SecretNumber.new(set_of_numbers)
		@set_of_numbers = set_of_numbers
		@current_guess = nil
		@messages = Hash.new 
			@messages[:win] = [ "Congratulations!  You have won the game! Don't you feel proud.", "Congratulations! You are an all star.", 
					"Woo Hoo! You rock!", "Oh yeah, you read my mind.", "You won!  Are you sure you aren't psychic?" ]

			@messages[:lose] = [ "You lose.  You are not the psychic John Edwards. The answer is #{@secret_number.secret_number}.",
					"Wa Wa Waaaaa. You lost. The answer is #{@secret_number.secret_number}.",
					"Ohhhhhhh Nooooooo. The sky is falling. You lost. The answer is #{@secret_number.secret_number}.", 
					"You lose.  You are not the Mayans. The answer is #{@secret_number.secret_number}." ]
			 
			@messages[:too_high] =  [ "Nope, you should try lower.", "No silly, try lower.", "Tsk tsk. Too high.", "Try lower you fool."]

			@messages[:too_low] = [ "Nope, you should try higher.", "Ha Ha, you make me laugh. Try higher.", "Try higher you fool.", "Does not compute. Try higher." ]
		#don't use @@ if you don't have to,Matthew says 
	end

	

	def guesses_left(tries)                                         
    	@guesses_allowed - tries
  	end 


	def guess_correct?(guess)                                                                                                                                           
    	if guess == @secret_number.secret_number                                       
      		true                                                                  
    	else 
      		false 
    	end
  	end      

	def show_message(msg)
      puts @messages[msg].sample
    end

  	def show_hint
    	if @current_guess > @secret_number.secret_number 
        	show_message :too_high
        else 
        	show_message :too_low
        end	
    end     
  
	def print_created_by
		puts "The Number Guessing Game"
		puts "Created by Melissa Wahnish"
		puts "Let's Play."
	end

	def start_game
		print_created_by
		puts "\nWhat is your name?"
		@player = gets.chomp
		
		begin
			raise Exception if @player.empty?	
			rescue Exception => error
				puts "Oops, no name.  Try program again."
				exit
			end 
		puts "Hi, #{@player}! You have #{@guesses_allowed} guesses to guess the Secret Number between #{@set_of_numbers.first} to #{@set_of_numbers.last}."

		@guesses_allowed.times do |attempts|                                                                                                                 
      		puts "\nYou have #{ guesses_left(attempts) } guesses left!"       
      		print "What is your guess? "                                                 
      		@current_guess = gets.to_i    

      		begin
			raise Exception if @current_guess == 0
			rescue Exception => error
				puts "Silly, put a number."
				puts "\nYou have #{ guesses_left(attempts) } guesses left!"       
      			print "What is your guess? "                                                 
      			@current_guess = gets.to_i
			end      

      		if guess_correct?(@current_guess)
        		show_message :win
        		puts "You guessed in #{attempts + 1} turns!"
        		exit                                                                    
      		else
        	show_hint unless guesses_left(attempts + 1).zero?
      		end     
      		                                                                 
    	end
    	puts @messages[:lose].sample
	end
end		
