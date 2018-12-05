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
    else
      return false
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
    # binding.pry
    if self.empty? == false
    @ship.hit
    @ship.health
    end
  end

  # def render(show_ship = false)
  #   # binding.pry
  #   if empty? == true
  #     if @fired_upon == false
  #       "."
  #     else
  #       "M"
  #     end
  #   else
  #     if @fired_upon == true && ship.sunk? == true
  #       "X"
  #     else
  #       "H"
  #     end
  #   end
    # if @ship.sunk?
    #   "X"
    # if @fired_upon == true && empty? == true
    #   "M"
    # elsif show_ship == true && empty? == false
    #   "S"
    # elsif @fired_upon == true && empty? == false
    #   if ship.sunk? == true
    #     "X"
    #   else
    #     "H"
    #   end
    # else
    #   "."
    # end
    def render(show_ship = false)
      if empty? == true
        render_empty
      else
        render_occupied
      end
    end

    def render_empty
      if fired_upon? == true
        "M"
      else
        "."
      end
    end

end
