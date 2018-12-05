class Cell
  attr_reader :coordinate,
              :ship,
              :fired_upon

  def initialize(coordinate_arg)
    @coordinate = coordinate_arg
    @ship = nil
    @fired_upon = false
  end

  def empty?
    if @ship == nil
    return true
    end
  end

  def place_ship(ship_arg)
    @ship = ship_arg
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    @ship.hit
    @ship.health
  end

end
