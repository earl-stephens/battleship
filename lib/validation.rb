require './lib/board'

class Validation < Board

  def valid_placement?(ship_arg, coordinate_arg)
    valididate_ship_length_and_coordinate_length(ship_arg, coordinate_arg)
    validate_consecutive_coordinates_when_placing_the_ship(ship_arg, coordinate_arg)
  end

  def valididate_ship_length_and_coordinate_length(ship_arg, coordinate_arg)
    if ship_arg.length == coordinate_arg.length
      true
    else
      false
    end
  end

  def validate_consecutive_coordinates_when_placing_the_ship(ship_arg, coordinate_arg)
    false
  end

end
