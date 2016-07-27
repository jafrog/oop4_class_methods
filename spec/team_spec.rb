require_relative "../lib/team.rb"

describe Team do
  it "builds a default team" do
    player_class = double("Player", new: nil)
    team = described_class.build_default(player_class)

    expect(team.players.count).to eq 5
  end

  xit "builds a team from a list of players"
end
