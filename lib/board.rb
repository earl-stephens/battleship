require 'pry'

class Board
  attr_reader :cell_hash,
              :key_array

  def initialize
    @cell_hash = {}
    @key_array = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
  end

  def cells
    @key_array.each do |key|
      @cell_hash[key] = Cell.new(key)
    end
    # binding.pry
    return @cell_hash
  end

  def valid_coordinate?(coordinate_arg)
    @key_array.any? {|key| key == coordinate_arg}
  end

# CEO method
  def valid_placement?(ship_arg, coordinates_arg)
    valid_ship_length?(ship_arg, coordinates_arg)
    consecutive_coordinates?(ship_arg, coordinates_arg)
  end

  def valid_ship_length?(ship_arg, coordinates_arg)
    if ship_arg.length == coordinates_arg.length
      true
    else
      false
    end
  end

  def consecutive_coordinates?(ship_arg, coordinates_arg)
    check_for_horizontal_and_vertical(ship_arg, coordinates_arg)
  end

  def check_for_horizontal_and_vertical(ship_arg, coordinates_arg)
    # if loop that call two methods below
    split_coordinate_array = []
      coordinates_arg.each do |coordinate|
        split_coordinate_array << coordinate.split(//)
      end
      binding.pry
    # if
    # elsif
    # else
    #   false
    # end
  end

  def check_for_consecutive_horizontal(ship_arg, coordinates_arg)

  end

  def check_for_consecutive_vertical(ship_arg, coordinates_arg)

  end

end
