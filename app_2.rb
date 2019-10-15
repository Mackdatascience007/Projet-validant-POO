require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player_2'

puts "                                              -------------------------------------------------"
puts "                                              |               Bienvenue sur :                 |"
puts "                                              |          'ILS VEULENT TOUS MA POO' !          |"
puts "                                              |Le but du jeu est d'être le dernier survivant !|"
puts "                                              -------------------------------------------------"
puts ""

puts "Si tu es CHUCK NORRIS ou SANGOKU passe ton chemin, sinon donne moi ton nom HUMAIN :"
name = gets.chomp
user = Humanplayer.new("#{name}")
puts ""

enemies = []
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies += [player1, player2]

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
    user.show_state
    puts ""
        puts "Choose your next moove :
        a = try to find new weapon
        s = try to find health pack
        0 = attack Josiane
        1 = attack José"
            choice = gets.chomp
            if choice == "a"
                user.search_weapon
            elsif choice == "s"
                user.search_health_pack
            elsif choice == "0"
                user.attacks(enemies[0])
            elsif choice == "1"
                user.attacks(enemies[1])
            else 
                puts "Es-tu un âne ? Are you ARIOL ? On t'as dit de choisir entre a, s, 0 ou 1"
            end
            puts ""
            if enemies[0].life_points > 0 || enemies[1].life_points > 0
                puts "Les autres joueurs t'attaquent !"
            end
                enemies.each do |enemies|
                    if enemies.life_points > 0
                    enemies.attacks(user)
                    end
                end

end
   
    if user.life_points > 0
        "BRAVO ! TU AS GAGNE !" 
    else
        "Loser ! Tu as perdu !"
    end

puts "La partie est finie" 
 



