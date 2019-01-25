# router.rb

require_relative 'lib/app/game'
require_relative 'lib/controller'


class Application

  def initialize
		@controller = Controller.new
  end 
  
	def perform
		puts "salut Maurice, voici le progamme potin !"
		while true

			puts "que veux tu faire?"
			puts " 1 -> jouer une partie"
			puts " 2 -> quitter l'application"

			choice = gets.chomp.to_i

			case choice
			when 1
				@controller.create_game
			when 2
				puts "bye, a bientôt"
				break
			else
				puts "ce choix n'existe pas, merci de reessayer"
			end

		end
	end
end
