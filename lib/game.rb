require 'pry'
require './lib/ship'
require './lib/board'

class Game
  attr_reader :board,
              :computer_cruiser,
              :computer_submarine,
              :human_cruiser,
              :human_submarine

  def initialize #OH PETER!!!!!
    @board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @human_cruiser = Ship.new("Cruiser", 3)
    @human_submarine = Ship.new("Submarine", 2)
    @board.cells
    # binding.pry
  end

  puts "Welcome to BATTLESHIP!"
  puts "Enter p to play. Enter q to quit."

  # input = gets.chomp
    # if input == "q"
    #    exit
    # else input == "p"
    #   #start game with magic
    # end

  # def
  #
  # end


end
