require 'game'


describe Game  do
    let (:player) { double :player }
    it 'Causes player to take damage' do
        expect(player).to receive(:take_damage)
        subject.attack(player)
    end 
end

