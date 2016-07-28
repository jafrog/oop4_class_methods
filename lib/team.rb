require_relative "player"

class Team
  def self.name=(name)
    @name = name
  end

  def self.name
    @name
  end

  def self.build(players)
    jammer = players.find(&:jammer?)
    return unless jammer

    pivot = players.find(&:pivot?)
    return unless pivot

    blockers = players.reject { |player| player.jammer? || player.pivot? }
    return unless blockers.count == 3

    new(name, jammer, pivot, blockers)
  end

  def self.build_default(player_class = Player)
    jammer   = player_class.new("Bambi Brainbox", jammer: true)
    pivot    = player_class.new("The Rib Jammer", pivot: true)
    blocker1 = player_class.new("Iridian Cyclone")
    blocker2 = player_class.new("Star Tsunami")
    blocker3 = player_class.new("Anastasia Dragonfly")

    new(name, jammer, pivot, [blocker1, blocker2, blocker3])
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
