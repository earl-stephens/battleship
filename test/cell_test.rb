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

  def test_if_a_cell_is_empty
      cell = Cell.new("B4")
      assert cell.empty?
  end

  def test_if_a_ship_is_placed
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal cruiser, cell.ship
  end

  def test_if_a_cell_is_not_empty
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    refute cell.empty?
  end

  def test_that_ship_was_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    refute cell.fired_upon?
  end

  def test_does_fired_upon_affect_ship_health
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon
    assert_equal 2, cell.ship.health
  end

end
