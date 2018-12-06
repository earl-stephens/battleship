require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/cell'
require './lib/ship'
require 'pry'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_there_is_a_hash_to_store_cells
    board = Board.new
    assert_empty(board.cell_hash)
  end

  def test_there_is_an_array_of_keys
    board = Board.new
    assert_equal ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"], board.key_array
  end

  def test_cell_hash_has_16_key_value_pairs
    board = Board.new
    board.cells
    assert_equal 16, board.cell_hash.length
  end

  def test_cell_hash_key_references_a_cell_object
    board = Board.new
    board.cells
    assert_instance_of Cell, board.cell_hash["A2"]
  end

end
