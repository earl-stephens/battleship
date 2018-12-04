require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test

  def test_it_exists
    cell = Cell.new("B4")
    assert_instance_of Cell, cell
  end

  def test_coordinate_of_cell
    cell = Cell.new("B4")
    assert_equal "B4", cell.coordinate
  end

  def test_if_cell_has_a_ship
    cell = Cell.new("B4")
    assert_equal nil, cell.ship
  end

end
