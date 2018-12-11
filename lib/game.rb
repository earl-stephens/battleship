require 'pry'
require './lib/ship'
require './lib/board'

class Game
  attr_reader :computer_board,
              :human_board,
              :computer_cruiser,
              :computer_submarine,
              :human_cruiser,
              :human_submarine,
              :coordinate_arg

  def initialize
    @computer_board = Board.new
    @human_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @human_cruiser = Ship.new("Cruiser", 3)
    @human_submarine = Ship.new("Submarine", 2)
    @computer_board.cells
    @human_board.cells
    @coordinate_arg = []
  end

 def main_menu
   puts "Welcome to BATTLESHIP!"
   puts "Enter p to play. Enter q to quit."

   input = gets.chomp

   if input == "q"
     exit
   end
   setup_for_computer
   setup_for_human
 end

 def setup_for_computer
   cruiser = Ship.new("Cruiser", 3)
   pick_axis_of_evil(cruiser)

 end

 def pick_axis_of_evil(ship_arg)
   axis_array = ["horizontal", "vertical"]
   axis_array.sample
   if axis_array.sample == "horizontal"
     pick_horizontal_coordinates(ship_arg)
   else
     pick_vertical_coordinates(ship_arg)
   end
 end

 def pick_horizontal_coordinates(ship_arg)
   if ship_arg.length == 3
     pick_horizontal_number_position_cruiser
   else
     pick_horizontal_number_position_submarine
   end
 end

 def pick_horizontal_number_position_cruiser
   coordinate_array = []
   number_array = [[1, 2, 3], [2, 3, 4]]
   random_number_array = number_array.sample
   letter_array = ["A", "B", "C", "D"]
   random_letter = letter_array.sample
     random_number_array.each do |number|
       coordinate_array << random_letter + number.to_s
     end
   return coordinate_array
 end

 def pick_horizontal_number_position_submarine
   coordinate_array = []
   number_array = [[1, 2], [2, 3], [3, 4]]
   random_number_array = number_array.sample
   letter_array = ["A", "B", "C", "D"]
   random_letter = letter_array.sample
     random_number_array.each do |number|
       coordinate_array << random_letter + number.to_s
     end
   return coordinate_array
 end

 def pick_vertical_coordinates(ship_arg)
   if ship_arg.length == 3
      pick_vertical_number_position_cruiser
  else
      pick_vertical_number_position_submarine
   end
 end

 def pick_vertical_number_position_cruiser
   coordinate_array = []
   letter_array = [["A", "B", "C"], ["B", "C", "D"]]
   random_letter_array = letter_array.sample
   number_array = [1, 2, 3, 4]
   random_number = number_array.sample
     random_letter_array.each do |letter|
       coordinate_array << letter + random_number.to_s
     end
     binding.pry
   return coordinate_array
 end

 def pick_vertical_number_position_submarine
   coordinate_array = []
   letter_array = [["A", "B"], ["B", "C"], ["C", "D"]]
   random_letter_array = letter_array.sample
   number_array = [1, 2, 3, 4]
   random_number = number_array.sample
     random_letter_array.each do |letter|
       coordinate_array << letter + random_number.to_s
     end
   return coordinate_array
 end

 def setup_for_human
   get_cruiser_coordinate_inputs
   cruiser = Ship.new("Cruiser", 3)
   place_ship(cruiser, coordinate_arg)
   render(true)
   get_sub_coordinate_inputs
   submarine = Ship.new("Submarine", 2)
   place_ship(submarine, coordinate_arg)
   render(true)
 end

  def get_cruiser_coordinate_inputs
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "Please enter the 3 coordinates for a cruiser"
    puts "Enter exactly in this format 'A1 A2 A3'"
    input_variable = gets.chomp
    # input_variable.split
    @coordinate_arg = input_variable.split
    # binding.pry
    return @coordinate_arg
    # binding.pry
  end

  def get_sub_coordinate_inputs
    puts "Please enter the 2 coordinates for a submarine"
    puts "Enter exactly in this format 'C1 C2'"
    input_variable = gets.chomp
    # input_variable.split
    @coordinate_arg = input_variable.split
    # binding.pry
    return @coordinate_arg
    # binding.pry
  end

  def place_ship(ship_arg, coordinate_arg)
    # binding.pry
    coordinate_arg = @coordinate_arg
    # cruiser = Ship.new("Cruiser", 3)
    # submarine = Ship.new("Submarine", 2)
    @human_board.place(ship_arg, coordinate_arg)
    # binding.pry
  end

  def render(show_ship)
    @human_board.render(show_ship)
  end






end
