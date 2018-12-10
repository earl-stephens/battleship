require 'pry'
require './lib/ship'
require './lib/board'

class Game
  attr_reader :computer_board,
              :human_board,
              :computer_cruiser,
              :computer_submarine,
              :human_cruiser,
              :human_submarine

  def initialize
    @computer_board = Board.new
    @human_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @human_cruiser = Ship.new("Cruiser", 3)
    @human_submarine = Ship.new("Submarine", 2)
    @computer_board.cells
    @human_board.cells
    # binding.pry
  end

  puts "Welcome to BATTLESHIP!"
  puts "Enter p to play. Enter q to quit."

  input = gets.chomp
    if input == "q"
       exit
    else input == "p"
      
    end

  def place_computer_ships(ship_arg, coordinate_arg)
    cruiser = Ship.new("Cruiser", 3)
    # submarine = Ship.new("Submarine", 2)
    @computer_board.place(cruiser, coordinate_arg)
    # binding.pry
  end


end
