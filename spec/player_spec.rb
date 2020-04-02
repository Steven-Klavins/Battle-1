require 'player'

describe Player do

  let(:dave) { described_class.new('Dave')}
  let(:pete) { described_class.new('Pete')}

  it '#name returns name attribute' do
    expect(dave.name).to eq 'Dave'
    expect(pete.name).to eq 'Pete'
  end
end
