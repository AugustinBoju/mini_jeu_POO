require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts " ---------------------------------"
puts "| Bienvenue sur BATTLE_ROYALE.POO |"
puts "| Soit le dernier à survivre !    |"
puts " ---------------------------------"

puts "Choisis ton pseudo :"
pseudo = gets.chomp.to_s
user = HumanPlayer.new(pseudo)
player1 = Player.new("Josiane")
player2 = Player.new("José")
ennemies = [player1, player2]

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts ""
  puts "#{user.show_state}"
  puts "Quelle action veut tu effectuer ?"
  puts ""
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts ""
  puts "attaquer un joueur en vue :"
  puts ""
  puts "0 - #{player1.show_state}"
  puts "1 - #{player2.show_state}"
  key = gets.chomp
  if key == "a"
    user.search_weapon
  elsif key == "s"
    user.search_health_pack
  elsif key == "0"
    user.attacks(player1)
  elsif key == "1"
    user.attacks(player2)
  end
  if player1.life_points > 0 || player2.life_points > 0
    puts "Les autres joueurs t'attaquent !"
    ennemies.each do |player|
      if player.life_points > 0
        player.attacks(user)
      end
    end
  end
  if player1.life_points <= 0 && player2.life_points <= 0
    puts "#{user.name} est le vainceur !!!!"
  elsif user.life_points <= 0
    puts " -----------------------"
    puts "|      GAME OVER        |"
    puts " -----------------------"
    puts "Restant en vie :"
    puts player1.show_state
    puts player2.show_state
  end
end
