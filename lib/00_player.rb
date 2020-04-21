class Player

	attr_accessor :name, :life_points

	def initialize(player_name)
    @name = player_name
    @life_points = 10
  end

  def show_state
    puts "> #{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage_point)
    @life_points = @life_points - damage_point
    if @life_points <= 0
      puts "> #{@name} a été tué !"
    end
  end

  def attacks(player)
    puts "> #{@name} attaque #{player.name}"
    damage = compute_damage
    puts "  Il lui inflige #{damage} points de dommages"
    player.gets_damage(damage)
  end

  def return_life_points
    points = @life_points
    return points
  end

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  
  attr_accessor :weapon_level, :life_points, :weapon_level

  def initialize(human_player_name)
    @name = human_player_name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "> #{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    level = rand(1..6)
    puts "> Tu as trouvé une arme de niveau #{level}"
    if level > @weapon_level
      @weapon_level = level
      puts "  Youhou! Elle est meilleure que ton arme actuelle.."
    else
      puts "  Merde! Elle n'est pas mieux que ton arme actuelle.."
    end
  end

  def search_health_pack
    found_life_points= rand(1..6)
    if found_life_points == 1
      puts "> Tu n'as rien trouvé... "
    end
    if found_life_points >= 2 && found_life_points <= 5 
      puts "> Bravo, tu as trouvé un pack de +50 points de vie !"
      @life_points = life_points + 50
      if @life_points >= 100
        @life_points = 100
      end
    end
    if found_life_points == 6
      puts "> Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points = life_points + 80
      if @life_points >= 100
        @life_points = 100
      end
    end
  end

end