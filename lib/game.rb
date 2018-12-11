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

  get_coordinate_inputs
  cruiser = Ship.new("Cruiser", 3)
  place_ship(cruiser, coordinate_arg)
  render(true)

 end

  def get_coordinate_inputs
    puts "Please enter the 3 coordinates for a cruiser"
    puts "Enter exactly in this format 'A1 A2 A3'"
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
