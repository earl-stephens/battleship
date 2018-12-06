class Cell
  attr_reader :coordinate,
              :ship,
              :fired_upon

  attr_accessor :show_ship

  def initialize(coordinate_arg)
    @coordinate = coordinate_arg
    @ship = nil
    @fired_upon = false
    @show_ship = false
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
    if self.empty? == false
      @ship.hit
    # not sure why the below code is here
    #Megan mentioned it
    # @ship.health
    end
  end

  def render
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

    def render_occupied
      if fired_upon? == false
        if @show_ship == true
          "S"
        else
          "."
        end
      else #fired_upon? == true
        if ship.sunk? == true
          "X"
        else
          "H"
        end
      end
    end

end
