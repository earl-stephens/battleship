require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/validation'
require 'pry'

class ValidationTest < Minitest::Test

  def test_it_exists
    # skip
    valid_object = Validation.new
    assert_instance_of Validation, valid_object
  end

  def test_number_of_coordinates_is_same_as_ship_length
    # skip
    cruiser = Ship.new("Cruiser", 3)
    board = Board.new
    board.cells
    valid_object = Validation.new

    valid_object.valid_placement?(cruiser, ["C1", "C2", "C3"])

    assert_equal true, valid_object.valididate_ship_length_and_coordinate_length?(cruiser, ["C1", "C2", "C3"])
  end

  def test_number_of_coordinates_is_same_as_ship_length_for_false_assertion
    # skip
    submarine = Ship.new("Submarine", 2)
    board = Board.new
    board.cells
    valid_object = Validation.new

    valid_object.valid_placement?(submarine, ["B2", "C2", "D2"])

    assert_equal false, valid_object.valididate_ship_length_and_coordinate_length?(submarine, ["B2", "C2", "D2"])
  end

  def test_for_consecutive_coordinates_sad_path
    # skip
    submarine = Ship.new("Submarine", 2)
    board = Board.new
    board.cells
    valid_object = Validation.new

    valid_object.valid_placement?(submarine, ["A1", "C1"])

    assert_equal false, valid_object.validate_consecutive_coordinates_when_placing_the_ship?(submarine)
  end

  def test_for_consecutive_coordinates_happy_path
    # skip
    cruiser = Ship.new("Cruiser", 3)
    board = Board.new
    board.cells
    valid_object = Validation.new

    valid_object.valid_placement?(cruiser, ["A1", "B1", "C1"])

    assert_equal true, valid_object.validate_consecutive_coordinates_when_placing_the_ship?(cruiser)
  end

  def test_for_consecutive_coordinates_diagonal
    # skip
    cruiser = Ship.new("Cruiser", 3)
    board = Board.new
    board.cells
    valid_object = Validation.new

    valid_object.valid_placement?(cruiser, ["A1", "B2", "C3"])

    assert_equal false, valid_object.validate_consecutive_coordinates_when_placing_the_ship?(cruiser)
  end

  def test_for_splitting_the_coordinate_array
    # skip
    submarine = Ship.new("Submarine", 2)
    cruiser = Ship.new("Cruiser", 3)
    board = Board.new
    board.cells
    valid_object = Validation.new

    valid_object.valid_placement?(cruiser, ["B2", "B3", "B4"])

    assert_equal [["B", "2"], ["B", "3"], ["B", "4"]], valid_object.split_coordinate_array
  end

  def test_for_populating_the_array_of_letters
    # skip
    cruiser = Ship.new("Cruiser", 3)
    board = Board.new
    board.cells
    valid_object = Validation.new

    valid_object.valid_placement?(cruiser, ["C2", "B2", "A2"])

    assert_equal ["A", "B", "C"], valid_object.array_of_letters
  end

  def test_for_populating_the_array_of_numbers
    # skip
    cruiser = Ship.new("Cruiser", 3)
    board = Board.new
    board.cells
    valid_object = Validation.new

    valid_object.valid_placement?(cruiser, ["B4", "B3", "B2"])

    assert_equal [2, 3, 4], valid_object.array_of_numbers
  end

  def test_for_populating_the_check_array
    # skip
    cruiser = Ship.new("Cruiser", 3)
    board = Board.new
    board.cells
    valid_object = Validation.new

    valid_object.valid_placement?(cruiser, ["C4", "B4", "D4"])

    assert_equal [66, 67, 68], valid_object.check_array
  end

  def test_for_consecutive_horizontal_coordinates_happy_path
    # skip
    cruiser = Ship.new("Cruiser", 3)
    board = Board.new
    board.cells
    valid_object = Validation.new

    valid_object.valid_placement?(cruiser, ["B4", "B3", "B2"])

    assert_equal true, valid_object.check_for_consecutive_horizontal(cruiser)
  end

  def test_for_consecutive_horizontal_coordinates_sad_path
    # skip
    cruiser = Ship.new("Cruiser", 3)
    board = Board.new
    board.cells
    valid_object = Validation.new

    valid_object.valid_placement?(cruiser, ["B4", "B3", "B1"])

    assert_equal false, valid_object.check_for_consecutive_horizontal(cruiser)
  end

  def test_for_consecutive_vertical_coordinates_happy_path
    # skip
    cruiser = Ship.new("Cruiser", 3)
    board = Board.new
    board.cells
    valid_object = Validation.new

    valid_object.valid_placement?(cruiser, ["B4", "C4", "A4"])

    assert_equal true, valid_object.check_for_consecutive_vertical
  end

  def test_for_consecutive_vertical_coordinates_sad_path
    # skip
    cruiser = Ship.new("Cruiser", 3)
    board = Board.new
    board.cells
    valid_object = Validation.new

    valid_object.valid_placement?(cruiser, ["B4", "D4", "A4"])

    assert_equal false, valid_object.check_for_consecutive_vertical
  end

  def test_coordinates_cant_be_diagonal_for_cruiser
    # skip
    cruiser = Ship.new("Cruiser", 3)
    board = Board.new
    board.cells
    valid_object = Validation.new

    valid_object.valid_placement?(cruiser, ["A1", "B2", "C3"])

    assert_equal false, valid_object.valid_placement?(cruiser, ["A1", "B2", "C3"])
  end

  def test_coordinates_cant_be_diagonal_for_submarine
    # skip
    submarine = Ship.new("Submarine", 2)
    board = Board.new
    board.cells
    valid_object = Validation.new

    valid_object.valid_placement?(submarine, ["C2", "D3"])

    assert_equal false, valid_object.valid_placement?(submarine, ["C2", "D3"])
  end

end
