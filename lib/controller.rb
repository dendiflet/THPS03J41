# controller.rb

require_relative 'view/view'


class Controller


  attr_accessor :new_game
  attr_reader :nb_games 

  #pour plus tard

  def create_game
  	@interface = Interface.new
  	#params = hash
  	params = @interface.start
  	binding.pry
  	@new_game = Games.new(params[:j1], params[:j2])

#binding.pry

   partie
  end

  def partie


  unless @new_game.turn > 9

  good_imput = { :ok => false }

  while good_imput[:ok] == false
  	binding.pry
    @interface.show(@new_game.j1m, @new_game.j2m)
    imput = @interface.ask(@new_game.cases_played, @new_game.player)
    good_imput = @new_game.imput_verification(imput, @new_game.cases_played)
  end

puts "je suis passé"
 end























  #fin de partie
  end

#fin de class
end
