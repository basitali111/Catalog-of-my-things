require './game'

game1 = Game.new('dota', '2020-10-26', '2010-10-05')
game2 = Game.new('Lol', '2022-10-26', '2015-10-05')

describe 'test Game constructor' do
  it 'takes the parameters and return and object' do
    expect(game1.instance_of?(Game)).to eq(true)
    expect(game2.instance_of?(Game)).to eq(true)
  end

  it 'game object should have a multiplayer parameter' do
    expect(game1.multiplayer).to eq('dota')
    expect(game2.multiplayer).to eq('Lol')
  end

  it 'game object should have a date' do
    expect(game1.publish_date).to eq('2010-10-05')
    expect(game2.publish_date).to eq('2015-10-05')
  end

  it 'game object should have a last_played_at' do
    expect(game1.last_played_at).to eq('2020-10-26')
    expect(game2.last_played_at).to eq('2022-10-26')
  end
end

describe 'test Game can_be_archived method' do
  it "return true if parent's method returns true AND if last_played_at is older than 2 year" do
    expect(game1.can_be_archived?).to eq(true)
    expect(game2.can_be_archived?).to eq(false)
  end
end
