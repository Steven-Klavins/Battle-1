require 'game'


describe Game  do
    let (:player) { double :player }
    let(:arg1) { double :player }
    let(:arg2) { double :player }
    let(:big_game) { Game.new(arg1,arg2)} 
    it 'Causes player to take damage' do
        expect(player).to receive(:take_damage)
        big_game.attack(player)
    end 

    it "should take two players when starting a new game" do
        expect { Game.new(arg1,arg2) }.to_not raise_error 
    end

    it "should be able to store player 1" do
        expect(big_game).to respond_to :player_one
    end
    it "should be able to store player 2" do
        expect(big_game).to respond_to :player_two
    end
end
