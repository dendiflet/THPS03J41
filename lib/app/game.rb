# game.rb

class Games

  attr_accessor :j1, :j2, :j1m, :j2m, :starter, :cases_played, :acase, :player, :turn, :winner

  attr_reader :win_combi

  @@win_combi = [["A1", "A2", "A3"], ["B1", "B2", "B3"], ["C1", "C2", "C3"], ["A1", "B1", "C1"], ["A2", "B2", "C2"], ["A3", "B3", "C3"], ["A1", "B2", "C3"], ["C1", "B2", "A3"]]



  def initialize(j1_name, j2_name)
  	@turn = 0
  	@j1 = j1_name
  	@j2 = j2_name
  	@j1m = Array.new
  	@j2m = Array.new
  	@case = Array.new
  	@player = Array.new
  	@starter = Array.new
  	@cases_played = Array.new
  	@winner = nil

    #who start?
    s = rand(1..2) 
    case s
    when 1
      @starter = @j1
    when 2
      @starter = @j2
    end
    @player = @starter
  end

  def imput_verification(imput, cases_allready_played)

    all_cases = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3", "1A", "2A", "3A", "1B", "2B", "3B", "1C", "2C", "3C"]

    puts imput.class


		#vérifier que l'entrée correspond bien a une case existante
		all_cases << imput #pousser juste la valeur et pas l'array avec [0]
		if all_cases.uniq! == nil
		  puts "#{" "*30}cette case n'existe pas\n"
		  return good_imput = {:ok => false}
		end
		puts "tu as bien rentré une case du jeu"

		if ("1".."3").cover? ("#{imput.chr}")
		  puts "par contre essaye de l'écrire a l'endroit"
		  # retourne l'imput
		  case_sized = imput.reverse!
		else
		  case_sized = imput
		end




cases_allready_played_copy = cases_allready_played + ["#{case_sized}"]
      
      #binding.pry 

    # compare la casse proposée a l'array de celles déja jouée

 	  if cases_allready_played_copy.uniq! == nil   #si pas en double uniq! renvoye nil
      #binding.pry 
 	    return good_imput = {:ok => true, :case_just_played_ok => case_sized}
 	  else
 	   	puts "case deja jouée, essaye une autre case\n"
 	   	return good_imput = {:ok => false}
 	  end
  end


  #maintenant que la acase est vérifier, faut faire les modifs
  def do_the_turn(just_played_case, game_var)
		cases_played << just_played_case
		@turn += 1

  	binding.pry
		case player
		when j1
			j1m << just_played_case
		when j2
			j2m << just_played_case
		end
  end

  # must return un hash avec  true, false
  def does_someone_win
#binding.pry
    @@win_combi.each do |combi|
	   	case player
			when j1
				#binding.pry
				combi_checker(combi, @j1m, @j1)
			when j2
	      combi_checker(combi, @j2m, @j2)
	    end
	  end
    if @winner != nil
    	return true
    else
    	return false
    end

  end

  def combi_checker(combinaison, cases_played, player)

  	#binding.pry
  	combinaison_copy = Array.new
  	combinaison_copy << combinaison 
  	combinaison_copy << cases_played
  	combinaison_copy.uniq!
  	if combinaison_copy.length == 3
  		binding.pry
  		@winner = player
  	end

  end
 
  def changing_player(j1, j2, player)
    temp = player
  	#binding.pry
    if temp == j1
  	  @player = j2
    else
  	  @player = j1
  	  binding.pry
    end

  end


# fin de class
end