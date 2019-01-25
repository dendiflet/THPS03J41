# controller.rb

require_relative 'view/view'


class Controller


  attr_accessor :new_game, :won
  attr_reader :nb_games 

  #pour plus tard

  def create_game
  	@interface = Interface.new
  	params = @interface.start
  	@new_game = Games.new(params[:j1], params[:j2])

    partie

  end

  def partie
  	@won = false
    while  @won != true || @new_game.turn == 9

    	#va afficher le morpion et demander/vérifier la saisie
      good_imput = { :ok => false }
      while good_imput[:ok] == false
        @interface.show
        imput = @interface.ask(@new_game.j1m, @new_game.j2m,@new_game.cases_played, @new_game.player)
        good_imput = @new_game.imput_verification(imput, @new_game.cases_played)
      end

      @new_game.do_the_turn(good_imput[:case_just_played_ok], @new_game)

      @won = @new_game.does_someone_win #(@new_game)
    #binding.pry


      @new_game.changing_player(@new_game.j1, @new_game.j2 , @new_game.player)
    end
    if @new_game.turn == 9
      @interface.loosers
    end
      if @won == true
        @interface.won(@new_game.winner)
      end


  #fin de partie
  end

#fin de class
end
