require './lib/board'
require 'pry'

class Validation < Board
  attr_reader :split_coordinate_array,
              :array_of_letters,
              :array_of_numbers,
              :array_of_ordinals,
              :check_array

  def initialize
    @split_coordinate_array = []
    @array_of_letters = []
    @array_of_numbers = []
    @array_of_ordinals = []
    @check_array = []
  end

  def valid_placement?(ship_arg, coordinate_arg)
    valididate_ship_length_and_coordinate_length?(ship_arg, coordinate_arg)
    break_down_the_coordinate_array(ship_arg, coordinate_arg)
    validate_consecutive_coordinates_when_placing_the_ship?(ship_arg, coordinate_arg)
  end

  def valididate_ship_length_and_coordinate_length?(ship_arg, coordinate_arg)
    if ship_arg.length == coordinate_arg.length
      true
    else
      false
    end
  end

  def break_down_the_coordinate_array(ship_arg, coordinate_arg)
    split_the_coordinate_array(coordinate_arg)
    populate_the_array_of_letters
    populate_the_array_of_numbers
    populate_the_check_array(ship_arg)
  end

  def split_the_coordinate_array(coordinate_arg)
    coordinate_arg.each do |coordinate|
      @split_coordinate_array << coordinate.split(//)
    end
    return @split_coordinate_array
  end

  def populate_the_array_of_letters
    @split_coordinate_array.each do |element|
      @array_of_letters << element[0]
    end
    @array_of_letters = @array_of_letters.sort
    return @array_of_letters
  end

  def populate_the_array_of_numbers
    @split_coordinate_array.each do |element|
      @array_of_numbers << element[1].to_i
    end
    @array_of_numbers = @array_of_numbers.sort
    return @array_of_numbers
  end

  def populate_the_check_array(ship_arg)
    # binding.pry
    start_range_number = @array_of_letters[0].ord
    end_range_number = start_range_number + (ship_arg.length - 1)
    range = start_range_number..end_range_number
    @check_array = range.to_a
    return @check_array

  end

  def validate_consecutive_coordinates_when_placing_the_ship?(ship_arg, coordinate_arg)
    check_for_consecutive_vertical
    check_for_consecutive_horizontal(ship_arg)
    # binding.pry
    if check_for_consecutive_vertical == true && check_for_consecutive_horizontal(ship_arg) == true
      return false
    end
    if check_for_consecutive_vertical == false && check_for_consecutive_horizontal(ship_arg) == false
      return false
    end
    if check_for_consecutive_vertical == true || check_for_consecutive_horizontal(ship_arg) == true
      return true
    end
  end

  def check_for_consecutive_vertical
    temp_array = []
    @array_of_letters.each do |element|
      temp_array << element.ord
    end
    if temp_array == @check_array
      true
    else
      false
    end
  end

  def check_for_consecutive_horizontal(ship_arg)
    start_range_number = @array_of_numbers[0]
    end_range_number = start_range_number + ship_arg.length - 1
    range = start_range_number..end_range_number
    temp_array = []
    temp_array = range.to_a
    # binding.pry
    if temp_array == @array_of_numbers
      true
    else
      false
    end
  end

end
