require 'player'

describe Player do

  let(:dave) { described_class.new('Dave')}
  let(:pete) { described_class.new('Pete')}

  it '#name returns name attribute' do
    expect(dave.name).to eq 'Dave'
    expect(pete.name).to eq 'Pete'
  end

  it '#take_damge causes player hp to lower by 10' do
    expect {pete.take_damage}.to change { pete.hp }.by(-10)
  end
end
