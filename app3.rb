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
my_game = Game.new(user_name)

while my_game.human_player.life_points >0 && my_game.enemies.count != 0

	my_game.kill_player 
	my_game.show_players
	my_game.menu
	print "> "
	user_choice = gets.chomp.to_s
	my_game.menu_choice(user_choice)
	my_game.enemies_attack
	my_game.is_still_ongoing?
	my_game.kill_player 
end

puts "-----------------------------------------------------"
my_game.end
puts "-----------------------------------------------------"