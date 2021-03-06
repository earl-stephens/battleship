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
              :coordinate_arg,
              :coordinate_array,
              :computer_cruiser_coordinates,
              :human_cruiser_coordinates,
              :shot_input,
              :computer_options_array,
              :shots_taken_array,
              :sunk_status

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
    @coordinate_array = []
    @computer_cruiser_coordinates = []
    @human_cruiser_coordinates = []
    @shots_taken_array = []
    @computer_options_array = @computer_board.key_array
    @sunk_status = false
  end

 def main_menu
   # binding.pry
   puts "Welcome to BATTLESHIP!"
   puts "Enter p to play. Enter q to quit."

   input = gets.chomp

   if input == "q"
     exit
   end
   setup_for_computer_cruiser
   setup_for_computer_submarine
   setup_for_human
   render_board
   turns
 end

 def turns
   player_shot
   computer_shot
   fire_on_computer_ship
   fire_on_human_ship
   report_results
   check_for_sunk_ship
 end

 def check_for_sunk_ship
   if @sunk_status == true
     puts "Winner!"
   else
     turns
   end
 end

 def setup_for_computer_cruiser
   cruiser = Ship.new("Cruiser", 3)
   pick_axis_of_evil(cruiser)
   coordinate_arg = @coordinate_array
   place_ship_computer(cruiser, coordinate_arg)
   @computer_cruiser_coordinates = @coordinate_array
 end

def setup_for_computer_submarine
   submarine = Ship.new("Submarine", 2)
   @coordinate_array = []
   pick_axis_of_evil(submarine)
   coordinate_arg = @coordinate_array
   place_ship_computer(submarine, coordinate_arg)
   puts "I have laid out my ships on the grid."
   puts "You now need to lay out your two ships."
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
     pick_horizontal_position_cruiser
   else
     pick_horizontal_position_submarine(ship_arg)
   end
 end

 def pick_horizontal_position_cruiser
   @coordinate_array = []
   number_array = [[1, 2, 3], [2, 3, 4]]
   random_number_array = number_array.sample
   letter_array = ["A", "B", "C", "D"]
   random_letter = letter_array.sample
     random_number_array.each do |number|
       @coordinate_array << random_letter + number.to_s
     end
   return @coordinate_array
 end

 def pick_horizontal_position_submarine(ship_arg)
   @coordinate_array = []
   number_array = [[1, 2], [2, 3], [3, 4]]
   random_number_array = number_array.sample
   letter_array = ["A", "B", "C", "D"]
   random_letter = letter_array.sample
     random_number_array.each do |number|
       @coordinate_array << random_letter + number.to_s
     end
   @computer_cruiser_coordinates.each do |element|
     if element == @coordinate_array[0]
       pick_axis_of_evil(ship_arg)
     elsif element == @coordinate_array[1]
       pick_axis_of_evil(ship_arg)
     else
       return @coordinate_array
    end
  end
 end

 def pick_vertical_coordinates(ship_arg)
   if ship_arg.length == 3
      pick_vertical_position_cruiser
  else
      pick_vertical_position_submarine(ship_arg)
   end
 end

 def pick_vertical_position_cruiser
   @coordinate_array = []
   letter_array = [["A", "B", "C"], ["B", "C", "D"]]
   random_letter_array = letter_array.sample
   number_array = [1, 2, 3, 4]
   random_number = number_array.sample
     random_letter_array.each do |letter|
       @coordinate_array << letter + random_number.to_s
     end
   return @coordinate_array
 end

 def pick_vertical_position_submarine(ship_arg)
   @coordinate_array = []
   letter_array = [["A", "B"], ["B", "C"], ["C", "D"]]
   random_letter_array = letter_array.sample
   number_array = [1, 2, 3, 4]
   random_number = number_array.sample
     random_letter_array.each do |letter|
       @coordinate_array << letter + random_number.to_s
     end
     @computer_cruiser_coordinates.each do |element|
       if element == @coordinate_array[0]
         pick_axis_of_evil(ship_arg)
       elsif element == @coordinate_array[1]
         pick_axis_of_evil(ship_arg)
       else
         return @coordinate_array
       end
    end
   return @coordinate_array
 end

 def place_ship_computer(ship_arg, coordinate_arg)
   coordinate_arg = coordinate_arg
   @computer_board.place(ship_arg, coordinate_arg)
 end

 def render_computer(show_ship)
   @computer_board.render(show_ship)
 end

 def setup_for_human
   get_cruiser_coordinate_inputs
   cruiser = Ship.new("Cruiser", 3)
   place_ship(cruiser, coordinate_arg)
   get_sub_coordinate_inputs
   submarine = Ship.new("Submarine", 2)
   place_ship(submarine, coordinate_arg)
 end

  def get_cruiser_coordinate_inputs
    puts "Please enter the 3 coordinates for a cruiser"
    puts "Enter exactly in this format 'A1 A2 A3'"
    input_variable = gets.chomp
    @coordinate_arg = input_variable.split
    @human_cruiser_coordinates = @coordinate_arg
    return @coordinate_arg
  end

  def get_sub_coordinate_inputs
    puts "Please enter the 2 coordinates for a submarine"
    puts "Enter exactly in this format 'C1 C2'"
    input_variable = gets.chomp
    @coordinate_arg = input_variable.split
    @human_cruiser_coordinates.each do |element|
      if element == @coordinate_arg[0]
        puts "Those are invalid coordinates. Please try again:"
        get_sub_coordinate_inputs
      elsif element == @coordinate_arg[1]
        puts "Those are invalid coordinates. Please try again:"
        get_sub_coordinate_inputs
      else
        return @coordinate_array
      end
   end
  end

  def place_ship(ship_arg, coordinate_arg)
    coordinate_arg = coordinate_arg
    @human_board.place(ship_arg, coordinate_arg)
  end

  def render(show_ship)
    @human_board.render(show_ship)
  end

  def render_board
    puts "=============COMPUTER BOARD============="
    @computer_board.render(true)
    puts "==============PLAYER BOARD=============="
    render(true)
  end

  def player_shot
    puts "Enter the coordinate for your shot:"
    @shot_input = gets.chomp
      @shots_taken_array.each do |shot|
        if shot == @shot_input
          puts "You have already fired on that spot."
          player_shot
        else
          validate_shot_input
        end
      end
    # validate_shot_input
  end

  def validate_shot_input
    if @human_board.key_array.find do |element|
        element == @shot_input
      end
        update_shots_take_array
      else
        puts "Please enter a valid coordinate:"
        @shot_input = gets.chomp
        validate_shot_input
      end
  end

  def update_shots_take_array
    @shots_taken_array << @shot_input
    return @shots_taken_array
  end

  def computer_shot
    @computer_shot = @computer_options_array.sample
    @computer_options_array.delete(@computer_shot)
    return @computer_shot
  end

  def fire_on_computer_ship
    @computer_board.cell_hash[@shot_input].fire_upon
  end

  def fire_on_human_ship
    @human_board.cell_hash[@computer_shot].fire_upon
  end

  def report_results
    human_shot = @computer_board.cell_hash[@shot_input].render
      if human_shot == "X"
        @sunk_status = true
      end
    puts "Your shot on #{@shot_input} was a #{human_shot}."
    computers_shot = @human_board.cell_hash[@computer_shot].render
      if computers_shot == "X"
        @sunk_status = true
      end
    puts "My shot on #{@computer_shot} was a #{computers_shot}."
    render_board
  end


end
