require 'bundler'
Bundler.require

require_relative 'lib/01_game'
require_relative 'lib/00_player'

#binding.pry

puts "-----------------------------------------------------"
puts "|     Bienvenue sur 'ILS VEULENT TOUS MA POO' !     |"
puts "|. Le but du jeu est d'être le dernier survivant    |"
puts "-----------------------------------------------------"

puts "Bonjour, c'est quoi ton Nom ?"
print "> "
user_name = gets.chomp
user = HumanPlayer.new(user_name)

enemies = []
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1,player2]

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)

	user.show_state
	user_choice = "z"
	
	while user_choice != "a" && user_choice != "s" && user_choice != "0" && user_choice != "1"

		puts "-----------------------------------------------------"
		puts "Quelle action veux-tu effectuer ?"
		puts "> a - chercher une meilleure arme"
		puts "> s - chercher à se soigner"
		puts "> Attaquer un joueur en vue:"
	
		if player1.life_points > 0 && player2.life_points > 0
		puts "  0 - Josiane a #{player1.life_points} points de vie"
		puts "  1 - José a #{player2.life_points} points de vie"
		print "> "
		user_choice = gets.chomp.to_s
		end

		if player1.life_points <= 0 && player2.life_points > 0
		puts "  0 - Josiane est morte"
		puts "  1 - José a #{player2.life_points} points de vie"
		print "> "
		user_choice = gets.chomp.to_s
		end

		if player1.life_points > 0 && player2.life_points <= 0
		puts "  0 - Josiane a #{player1.life_points} points de vie"
		puts "  1 - José est mort"
		print "> "
		user_choice = gets.chomp.to_s
		end
	end

	puts "-----------------------------------------------------"
	
	if user_choice == "a"
  	user.search_weapon
	end
	if user_choice == "s"
		user.search_health_pack   
	end
	if user_choice == "0"
		puts "> Tu attaque un joueur"
		if player1.life_points > 0
  		user.attacks(player1)
		else
			puts "  T'es en train d'attaquer une morte !"
			puts "  T'as raison, on sait jamais..."
		end
	end
	if user_choice == "1"
		puts "> Tu attaque un joueur"
  	if player2.life_points > 0
  		user.attacks(player2)
		else
			puts "  T'es en train d'attaquer un mort !"
			puts "  T'as raison, on sait jamais..."
		end
	end
	
	enemies.each do |enemy|
		if enemy.life_points > 0
			puts "> Un autre joueurs t'attaquent !"
  		enemy.attacks(user)
		end
	end

end
puts "-----------------------------------------------------"
puts "La partie est finie"

if user.life_points >0
     puts "BRAVO ! TU AS GAGNE !"
else
puts"Loser ! Tu as perdu !"
end
puts "-----------------------------------------------------"