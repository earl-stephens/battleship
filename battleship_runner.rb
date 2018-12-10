require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/validation'
require 'pry'

puts "Welcome to BATTLESHIP"
puts "Enter p to play. Enter q to quit."

input = gets.chomp
  if input == "q"
    exit
  end
