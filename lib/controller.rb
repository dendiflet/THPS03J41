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
        @interface.show(@new_game.j1m, @new_game.j2m)
        imput = @interface.ask(@new_game.cases_played, @new_game.player)
        good_imput = @new_game.imput_verification(imput, @new_game.cases_played)
      end

      @new_game.do_the_turn(good_imput[:case_just_played_ok], @new_game)

      won = @new_game.does_someone_win #(@new_game)
    
      if won == true
        @interface.winner(@new_game.winner)
      end
      
      @new_game.changing_player(@new_game.j1, @new_game.j2 , @new_game.player)

    #while turn 9 end
    end

    @interface.loosers

  #fin de partie
  end

#fin de class
end
