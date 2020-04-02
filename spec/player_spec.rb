require 'player'

describe Player do

  let(:dave) { described_class.new('Dave')}
  let(:pete) { described_class.new('Pete')}

  it '#name returns name attribute' do
    expect(dave.name).to eq 'Dave'
    expect(pete.name).to eq 'Pete'
  end

  it '#attack causes target hp to lower by 10' do
    expect { dave.attack(pete) }.to change { pete.hp }.by(-10)
  end
end
