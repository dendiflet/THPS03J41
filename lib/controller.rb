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
  	@new_game = Games.new(params[:j1], params[:j2])

    partie

  end

  def partie

    while @new_game.turn < 9

    	#va afficher le morpion et demander/vérifier la saisie
      good_imput = { :ok => false }
      while good_imput[:ok] == false
  	    #binding.pry
        @interface.show(@new_game.j1m, @new_game.j2m)
              #binding.pry 

        imput = @interface.ask(@new_game.cases_played, @new_game.player)
              #binding.pry 

        good_imput = @new_game.imput_verification(imput, @new_game.cases_played)
      end
#binding.pry
      @new_game.do_the_turn(good_imput[:case_just_played_ok], @new_game)
       puts "je suis passé"







    #while turn 9 end
    end

  #fin de partie
  end

#fin de class
end
