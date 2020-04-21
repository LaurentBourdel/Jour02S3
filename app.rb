require 'bundler'
Bundler.require

require_relative 'lib/01_game'
require_relative 'lib/00_player'

#binding.pry

player1 = Player.new("Josiane")
player2 = Player.new("José")
puts " "
while player1.life_points > 0 && player2.life_points >  0
	puts " "
	puts "Voici l'état de nos joueurs :"
	player1.show_state
	player2.show_state
	puts " "
	puts "Passons à la phase d'attaque :"
	player1.attacks(player2)
	if player2.life_points <= 0
		break
	end
	player2.attacks(player1)
	
end