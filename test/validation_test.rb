require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/validation'
require 'pry'

class ValidationTest < Minitest::Test

  def test_it_exists
    valid_object = Validation.new
  assert_instance_of Validation, valid_object
  end

def test_number_of_coordinates_is_same_as_ship_length
  cruiser = Ship.new("Cruiser", 3)
  board = Board.new
  board.cells
  valid_object = Validation.new

  valid_object.valid_placement?(cruiser, ["C1", "C2", "C3"])

  assert_equal true, valid_object.valididate_ship_length_and_coordinate_length(cruiser, ["C1", "C2", "C3"])
end

def test_number_of_coordinates_is_same_as_ship_length_for_false_assertion
  submarine = Ship.new("Submarine", 2)
  board = Board.new
  board.cells
  valid_object = Validation.new

  valid_object.valid_placement?(submarine, ["B2", "C2", "D2"])

  assert_equal false, valid_object.valid_placement?(submarine, ["B2", "C2", "D2"])
end

def test_for_consecutive_coordinates
  submarine = Ship.new("Submarine", 2)
  board = Board.new
  board.cells
  valid_object = Validation.new

  valid_object.valid_placement?(submarine, ["B2", "C3"])

  assert_equal false, valid_object.validate_consecutive_coordinates_when_placing_the_ship(submarine, ["B2", "C3"])
end

end
