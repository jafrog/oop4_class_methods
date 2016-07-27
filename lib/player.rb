class Player
  def initialize(name, jammer: false, pivot: false)
    @name = name
    @jammer = jammer
    @pivot = pivot
  end

  def jammer?
    @jammer
  end

  def pivot?
    @pivot
  end
end
