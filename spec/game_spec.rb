require 'game'


describe Game  do
    let (:player) { double :player }
    it 'Causes player to take damage' do
        subject.attack(player)
        expect(player).to receive :take_damage 
    end 
end

