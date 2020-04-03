class Player
  def initialize(name)
    @name = name
    @hp = 100
  end
  attr_reader :name, :hp

  def take_damage
    @hp -= 10
  end
end
