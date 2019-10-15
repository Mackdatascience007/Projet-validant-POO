class Player
    attr_accessor :name, :life_points

    def initialize(name)
        life_points = 10
        @name = name
        @life_points = life_points.to_i
    end

    def show_state
     return   "#{@name} a #{@life_points} points de vie"    
    end

    def gets_damage(damage_received)
        @life_points -= damage_received.to_i
            if  @life_points < 0
                @life_points = 0
                "GAME OVER : #{@name} is DEAD !!!"
            else 
                puts show_state
            end
    end

    def attacks(player)
        damage_received = compute_damage
        puts "le joueur #{@name} attaque le joueur #{player.name}"
        puts "il lui inflige #{damage_received} points de dommages"
        puts player.gets_damage(damage_received)
      
    end

    def compute_damage
        return rand(1..6)
    end
end



class Humanplayer < Player   
    attr_accessor :life_points, :weapon_level
    
    def initialize(name)
          @name = name
          @life_points = 100
          @weapon_level = 1
    end

    def show_state
        puts   "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}" 
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon}"
        if new_weapon < @weapon_level 
            "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        elsif new_weapon == @weapon_level
            "Laisse tombé, c'est pareil"
        else @weapon_level = new_weapon
            "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
        end
    end

    def search_health_pack
        health_pack = rand(1..6)
        if health_pack == 1
            puts "Tu n'as rien trouvé"
        elsif health_pack == 6
            @life_points += 80 
                if @life_points > 100
                    @life_points = 100    
                end
            puts "Waow, tu as trouvé un pack de +80 points de vie ! Tu as maintenant #{life_points} vies"
            
        else 
            @life_points += 50 
                if @life_points > 100
                    @life_points = 100    
                end
            puts "Bravo, tu as trouvé un pack de +50 points de vie ! Tu as maintenant #{life_points} vies"
        end
    end











end



