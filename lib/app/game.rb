# game.rb

class Games

  attr_accessor :j1, :j2, :j1m, :j2m, :starter, :cases_played, :case, :player, :turn

  def initialize(j1_name, j2_name)
  	@turn = 0
  	@j1 = j1_name
  	@j2 = j2_name
  	@j1m = Array.new
  	@j2m = Array.new
  	@cases = Array.new
  	@player = Array.new
  	@starter = Array.new
  	@cases_played = Array.new

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
#binding.pry
    # ajoute la casse proposée a celles déja jouée
    cases_allready_played << case_sized #ajout de la val sinon trop de 
    #binding.pry

 	  if cases_allready_played.uniq! == nil   #si pas en double uniq! renvoye nil
      #binding.pry 
 	    return good_imput = {:ok => true, :case => case_sized}
 	  else
 	   	puts "case deja jouée, essaye une autre case\n"
 	   	return good_imput = {:ok => false}
 	  end
  end




end