class Player
  def initialize(name)
    @name = name
    @hp = 100
  end
  attr_reader :name, :hp

  def attack(target)
    target.take_damage
  end

  def take_damage
    @hp -= 10
  end
end
