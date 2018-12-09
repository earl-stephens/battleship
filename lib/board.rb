require 'pry'
# require './lib/validation'
# require './lib/cell'

class Board
  attr_reader :cell_hash,
              :key_array
              # :split_coordinate_array,
              # :split_coordinate_letter_array

  def initialize
    @cell_hash = {}
    @key_array = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    # @split_coordinate_array = []
    # @split_coordinate_letter_array = []
  end

  def cells
    @key_array.each do |key|
      @cell_hash[key] = Cell.new(key)
    end
    # binding.pry
    return @cell_hash
  end

  # CEO Method
  def place(ship_arg, coordinate_arg)
    valid_coordinate?(coordinate_arg)
    run_valid_placement?(ship_arg, coordinate_arg)
  end

  def valid_coordinate?(coordinate_arg)
    temporary_array = []
    # binding.pry
    coordinate_arg.each do |coordinate|
      temporary_array << @key_array.any? {|key| key == coordinate}
      # binding.pry
    end
    if temporary_array.any? {|value| value == false}
      # binding.pry
      return false
    else
      return true
    end
  end

  def run_valid_placement?(ship_arg, coordinate_arg)

  end

# CEO method
  # def valid_placement?(ship_arg, coordinates_arg)
  #   valid_ship_length?(ship_arg, coordinates_arg)
  #   consecutive_coordinates?(ship_arg, coordinates_arg)
  # end
  #
  # def valid_ship_length?(ship_arg, coordinates_arg)
  #   if ship_arg.length == coordinates_arg.length
  #     true
  #   else
  #     false
  #   end
  # end
  #
  # def consecutive_coordinates?(ship_arg, coordinates_arg)
  #   split_coordinate_array_method(ship_arg, coordinates_arg)
  #   check_for_horizontal_and_vertical(ship_arg, coordinates_arg)
  # end
  #
  # def check_for_horizontal_and_vertical(ship_arg, coordinates_arg)
      # split_coordinate_array_method(ship_arg, coordinates_arg)
      # split_the_coordinate_array_for_letters(ship_arg)
      # split_the_coordinate_array_for_letters(ship_arg)
      # split_the_coordinate_array_for_numbers(ship_arg)
    # if loop that call two methods below
    # put below method into own method
      # split_coordinate_array = []
      # coordinates_arg.each do |coordinate|
      #   split_coordinate_array << coordinate.split(//)
      # end
      # testing vertical placement loop
        # if split_coordinate_array[0][0] == split_coordinate_array[1][0] == split_coordinate_array[2][0]
        #   puts horizontal
        #   check_for_consecutive_horizontal(ship_arg, coordinates_arg)
        # else split_coordinate_array[0][1] == split_coordinate_array[1][1] == split_coordinate_array[2][1]
        #   puts vertical
        #   check_for_consecutive_vertical(ship_arg, coordinates_arg)
        #
        # end
  # end
  #
  # def split_coordinate_array_method(ship_arg, coordinates_arg)
  #     coordinates_arg.each do |coordinate|
  #       @split_coordinate_array << coordinate.split(//)
  #       end
  #     return @split_coordinate_array
  # end


  # def split_the_coordinate_array_for_letters(ship_arg)
# binding.pry
  #   3.times do |coordinate|
  #     # binding.pry
  #     @split_coordinate_letter_array << @split_coordinate_array[coordinate][0]
  #   end
  #   return @split_coordinate_letter_array
  # end
  #
  # def split_the_coordinate_array_for_numbers(ship_arg)
  #   split_coordinate_number_array = []
  #   3.times do |coordinate|
  #     split_coordinate_number_array << @split_coordinate_array[coordinate][0]
  #   end
  #   return split_coordinate_number_array
  # end
  # def check_for_consecutive_horizontal(ship_arg, coordinates_arg)
  #
  # end
  #
  # def check_for_consecutive_vertical(ship_arg, coordinates_arg)
  #
  # end

end
