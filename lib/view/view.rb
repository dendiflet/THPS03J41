# view.rb

class Interface

attr_accessor :J1, :J2, :params

	def start
		puts "quel est le prénom du joueur 1 ?"
		player1_name = gets.chomp.to_s
		puts "quel est le prénom du joueur 2 ?"
		player2_name = gets.chomp.to_s
		
		return @params = {
			j1: "#{player1_name}", 
			j2: "#{player2_name}" 
		}

	end

  def show
    puts "\n voici la grille de morpions\n"
    puts "       A1|B1|C1 "
    puts "      ----------"
    puts "       A2|B2|C2 "
    puts "      ----------"
    puts "       A3|B3|C3 \n"
  end

  def ask(array_j1_cases_played, array_j2_cases_played, case_deja_jouee, actual_player)    
 	  print "#{@params[:j1]} a jouer ces cases #{array_j1_cases_played} \n"
 	  print "#{@params[:j2]} a jouer ces cases #{array_j2_cases_played} \n"
    puts "quel case veut tu jouer #{actual_player} ?"
 	  gets.chomp.upcase
  end

  def won(which_one)
  	puts "\nbravo Marcel, enfin #{which_one} je veux dire, tu as gagné\n\n"
  end

  def loosers
  	puts "personne n'a gagné"
  end


end
