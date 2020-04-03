class Game
    attr_reader :player_one, :player_two

    def initialize(arg1,arg2)
        @player_one = arg1
        @player_two = arg2
    end

    def attack (player)
        player.take_damage
    end
end

