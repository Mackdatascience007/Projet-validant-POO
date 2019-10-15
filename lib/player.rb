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