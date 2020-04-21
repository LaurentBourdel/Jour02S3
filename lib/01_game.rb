
class Game

	attr_accessor :human_player, :enemies

	def initialize(human_player_name)

  	@human_player = HumanPlayer.new(human_player_name)

		player1 = Player.new("Bot n°1")
		player2 = Player.new("Bot n°2")
		player3 = Player.new("Bot n°3")
		player4 = Player.new("Bot n°4")
		@enemies = [player1,player2,player3,player4]
	
	end

	def kill_player

		@enemies.each_with_index do |enemy, index|
			if enemy.life_points < 1
				@enemies.delete_at(index)
			end
		end
	end

	def is_still_ongoing?

		if @human_player.life_points > 0 && @enemies.length == 0
			return true
		end
		if @human_player.life_points <= 0
			return false
		end
		if @enemies.length != 0
			return false
		end
	end

	def show_players
		puts "-----------------------------------------------------"
		puts "> #{@human_player.name} a #{@human_player.life_points} points de vie et une arme de niveau #{@human_player.weapon_level}"
		puts "> Il reste #{@enemies.count} bots.."
	end

	def menu

		puts "-----------------------------------------------------"
		puts "Quelle action veux-tu effectuer ?"
		puts "> a - chercher une meilleure arme"
		puts "> s - chercher à se soigner"
		puts "Attaquer un bot en vue ?"

		@enemies.each_with_index do |enemy, index|
			puts "> #{index} - #{enemy.name} a #{enemy.life_points} points de vie"
		end
	end

	def menu_choice(choice)

		if choice == "a"
  		@human_player.search_weapon
		end
		if choice == "s"
			@human_player.search_health_pack   
		end
		if choice == "0"
			puts "-----------------------------------------------------"
			if @enemies[choice.to_i].life_points.to_i > 0
  			@human_player.attacks(@enemies[choice.to_i])
			end
		end
		if choice == "1"
			puts "-----------------------------------------------------"
  		if @enemies[choice.to_i].life_points.to_i  > 0
  			@human_player.attacks(@enemies[choice.to_i])
			end
		end
		if choice == "2"
			puts "-----------------------------------------------------"
  		if @enemies[choice.to_i].life_points.to_i  > 0
  			@human_player.attacks(@enemies[choice.to_i])
			end
		end
		if choice == "3"
			puts "-----------------------------------------------------"
  		if @enemies[choice.to_i].life_points.to_i  > 0
  			@human_player.attacks(@enemies[choice.to_i])
			end
		end
	end

	def enemies_attack
	puts "-----------------------------------------------------"
	@enemies.each_with_index do |enemy, index|
			if enemy.life_points > 0
  			enemy.attacks(@human_player)
			end
		end
	end

	def end

		puts "-----------------------------------------------------"
		puts "La partie est finie"

		if @enemies.count == 0
    	 puts "BRAVO ! TU AS GAGNE !"
		else
			puts"Loser ! Tu as perdu !"
		end
		puts "-----------------------------------------------------"
	end

end
