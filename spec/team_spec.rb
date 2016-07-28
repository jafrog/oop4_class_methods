require_relative "../lib/team.rb"

describe Team do
  it "builds a default team" do
    player_class = double("Player", new: nil)
    team = described_class.build_default(player_class)

    expect(team.players.count).to eq 5
  end

  it "builds a team from a list of players" do
    jammer = double("Player", jammer?: true, pivot?: false)
    pivot = double("Player", jammer?: false, pivot?: true)
    blockers = Array.new(3) { double("Player", jammer?: false, pivot?: false) }
    players = [jammer, pivot, *blockers]

    team = described_class.build(players)
    expect(team.players.count).to eq 5
    expect(team.players.find(&:jammer?)).to eq jammer

    expect(described_class.build([])).to be_nil
    expect(described_class.build(blockers)).to be_nil
  end
end
