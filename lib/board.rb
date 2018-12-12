require 'pry'
require './lib/validation'
require './lib/cell'

class Board
  attr_reader :cell_hash,
              :key_array,
              :placement_failure
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
    # binding.pry
    valid_coordinate?(coordinate_arg)
    if valid_coordinate?(coordinate_arg) == false
      puts "valid coordinate? fails"
      @placement_failure = true
    end
    # binding.pry
    overlap?(ship_arg, coordinate_arg)
    if overlap?(ship_arg, coordinate_arg) == true
      puts "overlap? fails"
      @placement_failure = true
    end
    # binding.pry
    run_valid_placement?(ship_arg, coordinate_arg)
    if run_valid_placement?(ship_arg, coordinate_arg) == false
      puts "run valid placement fails"
      @placement_failure = true
    end
    place_ship_in_cells(ship_arg, coordinate_arg)
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
    # binding.pry
    valid_object = Validation.new
    valid_object.valid_placement?(ship_arg, coordinate_arg)
    # binding.pry
  end

  def overlap?(ship_arg, coordinate_arg)
    # binding.pry
    temporary_array = []
    coordinate_arg.length.times do |counter|
      # binding.pry
      temporary_array << @cell_hash[coordinate_arg[counter]].empty?
    end
    # binding.pry
    if temporary_array.any? {|answer| answer == false}
      return true
    else
      return false
    end
  end

  def place_ship_in_cells(ship_arg, coordinate_arg)
    if @placement_failure == true
      puts "failure"
    end
    coordinate_arg.length.times do |counter|
    @cell_hash[coordinate_arg[counter]].place_ship(ship_arg)
    # binding.pry
    end
    # binding.pry
  end

  def check_same_ship?(ship_arg, coordinate_arg)
    temp_array = []
    coordinate_arg.each do |coordinate|
      temp_array << @cell_hash[coordinate].ship
    end
    if temp_array.uniq.length == 1
      return true
    else
      return false
    end
  end

  def render(show_ship)
    render_array = []
    @cell_hash.each do |key, value|
      render_array << value.render(show_ship)
    end
### change back to puts later
    puts " 1 2 3 4 \n" + "A " + render_array[0].to_s + " " + render_array[1].to_s + " " + render_array[2].to_s + " " + render_array[3].to_s + "\nB " + render_array[4].to_s + " " + render_array[5].to_s + " " + render_array[6].to_s + " " + render_array[7].to_s + "\nC " + render_array[8].to_s + " " + render_array[9].to_s + " " + render_array[10].to_s + " " + render_array[11].to_s + "\nD " + render_array[12].to_s + " " + render_array[13].to_s + " " + render_array[14].to_s + " " + render_array[15].to_s
  end

end
