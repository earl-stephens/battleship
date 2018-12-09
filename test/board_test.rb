require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/cell'
require './lib/ship'
# require './lib/validation'
require 'pry'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_there_is_a_hash_to_store_cells
    # skip
    board = Board.new
    assert_equal ({}), board.cell_hash
  end

  def test_there_is_an_array_of_keys
    # skip
    board = Board.new
    assert_equal ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"], board.key_array
  end

  def test_cell_hash_has_16_key_value_pairs
    # skip
    board = Board.new
    board.cells
    assert_equal 16, board.cell_hash.length
  end

  def test_cell_hash_key_references_a_cell_object
    # skip
    board = Board.new
    board.cells
    assert_instance_of Cell, board.cell_hash["A2"]
  end

  def test_a_valid_coordinate_is_valid
    board = Board.new
    board.cells

    board.valid_coordinate?(["A1"])
# binding.pry
    assert_equal true, board.valid_coordinate?(["A1"])

    # board.valid_coordinate?(["D4"])
    #
    # assert_equal true, board.valid_coordinate?(["D4"])
  end

  def test_an_invalid_coordinate_letter_is_invalid
    # skip
    board = Board.new
    board.cells

    board.valid_coordinate?(["E1"])

    assert_equal false, board.valid_coordinate?(["E1"])
  end

  def test_an_invalid_coordinate_number_is_invalid
    # skip
    board = Board.new
    board.cells

    board.valid_coordinate?(["A5"])

    assert_equal false, board.valid_coordinate?(["A5"])
  end

  def test_an_invalid_coordinate_letter_and_number_is_invalid
    # skip
    board = Board.new
    board.cells

    board.valid_coordinate?(["F22"])

    assert_equal false, board.valid_coordinate?(["F22"])
  end

  # CEO method
  def test_board_place_method

  end

  def test_valid_placement_after_calling_place_method
    # skip
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    board = Board.new
    board.cells
    board.place(cruiser, ["B2", "B3", "B4"])

    assert_equal true, board.valid_coordinate?(["B2", "B3", "B4"])

  end

  def test_valid_placement_with_validation_object
    # skip
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    board = Board.new
    board.cells
    board.place(cruiser, ["B2", "B3", "B4"])
    # binding.pry

    assert_equal true, board.run_valid_placement?(cruiser,["B2", "B3", "B4"])
  end

  def test_placing_a_ship_in_a_cell
    # skip
    cruiser = Ship.new("Cruiser", 3)
    board = Board.new
    board.cells

    board.place(cruiser, ["A1", "A2", "A3"])

    assert_equal cruiser, board.cell_hash["A1"].ship
    assert_equal cruiser, board.cell_hash["A2"].ship
    assert_equal cruiser, board.cell_hash["A3"].ship
  end

  def test_that_the_same_ship_is_in_each_of_its_cells
    # skip
    cruiser = Ship.new("Cruiser", 3)
    board = Board.new
    board.cells

    board.place(cruiser, ["A1", "A2", "A3"])

    assert_equal true, board.check_same_ship?(cruiser, ["A1", "A2", "A3"])
  end

end




#
#
# def test_the_split_coordinate_array_method_for_cruiser
#   skip
#   cruiser = Ship.new("Cruiser", 3)
#   board = Board.new
#   board.cells
#
#   board.valid_placement?(cruiser, ["A1", "A2", "A3"])
#
#   assert_equal [["A", "1"], ["A", "2"], ["A", "3"]], board.split_coordinate_array
# end
#
# def test_the_split_coordinate_array_method_for_sub
#   skip
#   submarine = Ship.new("Submarine", 2)
#   board = Board.new
#   board.cells
#
#   board.valid_placement?(submarine, ["C3", "B3"])
#
#   assert_equal [["C", "3"], ["B", "3"]],  board.split_coordinate_array
# end
#
# def test_valid_placement_checks_coordinates_and_ship_length_are_not_equal
#   skip
#   cruiser = Ship.new("Cruiser", 3)
#   submarine = Ship.new("Submarine", 2)
#   board = Board.new
#   board.cells
#
#   board.valid_placement?(cruiser, ["A1", "A2"])
#
#   assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
#
#   board.valid_placement?(submarine, ["A2", "A3", "A4"])
#
#   assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
# end
#
# def test_valid_placement_checks_coordinates_and_ship_length_are_equal
#   skip
#   cruiser = Ship.new("Cruiser", 3)
#   submarine = Ship.new("Submarine", 2)
#   board = Board.new
#   board.cells
#
#   board.valid_placement?(cruiser, ["A1", "A2", "A3"])
#
#   assert_equal true, board.valid_placement?(cruiser, ["A1", "A2", "A3"])
#
#   board.valid_placement?(submarine, ["C2", "D2"])
#
#   assert_equal true, board.valid_placement?(submarine, ["C2", "D2"])
# end
#
# def test_the_split_coordinate_array_for_letters_method
#   skip
#   cruiser = Ship.new("Cruiser", 3)
#   board = Board.new
#   board.cells
#
#   board.valid_placement?(cruiser, ["A1", "A2", "A3"])
#
#   assert_equal ["A", "A", "A"], board.split_coordinate_letter_array
# end
#
# def test_the_split_coordinate_array_for_numbers_method
#   skip
#
#   cruiser = Ship.new("Cruiser", 3)
#   submarine = Ship.new("Submarine", 2)
#   board = Board.new
#   board.cells
#   board.valid_placement?(cruiser, ["A1", "A2", "A3"])
#
#   board.check_for_horizontal_and_vertical(cruiser, ["A1", "A2", "A3"])
#
#   assert_equal ["1", "2", "3"], board.split_the_coordinate_array_for_numbers(cruiser, ["A1", "A2", "A3"])
# end
#
# def test_valid_placement_checks_consecutive_coordinates
#   skip
#   cruiser = Ship.new("Cruiser", 3)
#   submarine = Ship.new("Submarine", 2)
#   board = Board.new
#   board.cells
#
#   board.valid_placement?(cruiser, ["A1", "A2", "A4"])
#
#   assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
# end
#
# def test_check_for_horizontal_and_vertical
#   skip
#   cruiser = Ship.new("Cruiser", 3)
#   submarine = Ship.new("Submarine", 2)
#   board = Board.new
#   board.cells
#
#   board.valid_placement?(cruiser, ["A1", "B2", "A4"])
#
#   assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "A4"])
# end
