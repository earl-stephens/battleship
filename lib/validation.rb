require './lib/board'
require 'pry'

class Validation
  attr_reader :split_coordinate_array,
              :array_of_letters,
              :array_of_numbers,
              :check_array
              # :ship_arg,
              # :coordinate_arg

  def initialize
    @split_coordinate_array = []
    @array_of_letters = []
    @array_of_numbers = []
    @check_array = []
    # @ship_arg = ship_arg
    # @coordinate_arg = coordinate_arg
  end

# CEO method
  def valid_placement?(ship_arg, coordinate_arg)
    # if overlap?(ship_arg, coordinate_arg) == true
    #   return false
    # else
    valididate_ship_length_and_coordinate_length?(ship_arg, coordinate_arg)
    #this next method isn't used in the decision tree
    break_down_the_coordinate_array(ship_arg, coordinate_arg)
    validate_consecutive_coordinates_when_placing_the_ship?(ship_arg)
    # binding.pry
    #decision tree to return t/f for valid_placement?
      if valididate_ship_length_and_coordinate_length?(ship_arg, coordinate_arg) == true && validate_consecutive_coordinates_when_placing_the_ship?(ship_arg) == true
        return true
      else
        return false
      end
    # end
  end

  # def overlap?(ship_arg, coordinate_arg)
  #   binding.pry
  #   temporary_array = []
  #   coordinate_arg.length.times do |counter|
  #     temporary_array << board.cell_hash[coordinate_arg[counter - 1]].empty?
  #   end
  #   if temp_array.any? {|answer| answer = true}
  #     return false
  #   else
  #     return true
  #   end
  # end

  def valididate_ship_length_and_coordinate_length?(ship_arg, coordinate_arg)
    if ship_arg.length == coordinate_arg.length
      true
    else
      false
    end
  end

# CEO method for coordinate breakdown
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
    start_range_number = @array_of_letters[0].ord
    #what the expected end should be
    end_range_number = start_range_number + (ship_arg.length - 1)
    range = start_range_number..end_range_number
    @check_array = range.to_a
    return @check_array
  end

# almost CEO method
  def validate_consecutive_coordinates_when_placing_the_ship?(ship_arg)
    check_for_consecutive_vertical
    check_for_consecutive_horizontal(ship_arg)
    #cant have both true - it would mean that a ship is consecutive
    #in both horizontal and vertical at the same time
    if check_for_consecutive_vertical == true && check_for_consecutive_horizontal(ship_arg) == true
      return false
    end
    #if the and statement is true, want the result to return false
    #because this isn't a possible placement
    if check_for_consecutive_vertical == false && check_for_consecutive_horizontal(ship_arg) == false
      return false
    end
    if check_for_consecutive_vertical == true || check_for_consecutive_horizontal(ship_arg) == true
      return true
    end
  end

  def check_for_consecutive_vertical
    #change given coordinate letters to numbers
    temp_array = []
    @array_of_letters.each do |element|
      temp_array << element.ord
    end
    #compare given (temp_array) to truth (@check_array)
    if temp_array == @check_array
      true
    else
      false
    end
  end

  def check_for_consecutive_horizontal(ship_arg)
    #set up truth array which is the true, expected values
    start_range_number = @array_of_numbers[0]
    end_range_number = start_range_number + ship_arg.length - 1
    range = start_range_number..end_range_number
    temp_array = []
    temp_array = range.to_a
    #compare truth (temp_array) to user coordinates (given in
    #@array_of_numbers)
    if temp_array == @array_of_numbers
      true
    else
      false
    end
  end
end
