require_relative "player"

class Team
  def self.build_default(player_class = Player)
    jammer   = player_class.new("Bambi Brainbox", jammer: true)
    pivot    = player_class.new("The Rib Jammer", pivot: true)
    blocker1 = player_class.new("Iridian Cyclone")
    blocker2 = player_class.new("Star Tsunami")
    blocker3 = player_class.new("Anastasia Dragonfly")

    new("Gotham bombs", jammer, pivot, [blocker1, blocker2, blocker3])
  end

  attr_reader :jammer, :pivot, :blockers

  def initialize(name, jammer, pivot, blockers)
    @name = name
    @jammer = jammer
    @pivot = pivot
    @blockers = [pivot, *blockers]
  end

  def players
    [jammer, *blockers]
  end
end
