class Player

  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} à #{life_points} points de vie"
  end

  def gets_damage(dgt)
    @life_points = @life_points - dgt
    if @life_points <= 0
      puts "le joueur #{@name} a été tué !"
    end
  end

  def attacks(victim)
    puts "#{@name} attaque #{victim.name}"
    dmg = compute_damage
    puts "il lui inflige #{dmg} points de dommages"
    victim.gets_damage(dmg)
  end

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @weapon_level = 1
    @life_points = 100
  end

  def show_state
    puts "#{@name} à #{life_points} points de vie et une arme de niveau #{weapon_level}"
  end

  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    if new_weapon > @weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      @weapon_level = new_weapon
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_health_pack
    find = rand(1..6)
    if find == 1
      puts "Tu n'as rien trouvé... "
    elsif find >= 2 && find <= 5
      if @life_points > 50
        @life_points = 100
      else
        @life_points = @life_points + 50
      end
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      puts "Tu as maintenant #{@life_points} points de vie"
    elsif find == 6
      if @life_points > 20
        @life_points = 100
      else
        @life_points = @life_points + 80
      end
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      puts "Tu as maintenant #{@life_points} points de vie"
    end
  end
end
