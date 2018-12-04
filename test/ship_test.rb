require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def test_it_exists
    cruiser = Ship.new("Cruiser", 3)

    assert_instance_of Ship, cruiser
  end

  def test_it_has_a_name
    cruiser = Ship.new("Cruiser", 3)

    assert_equal "Cruiser", cruiser.name
  end

  def test_it_can_have_a_different_name
    submarine = Ship.new("Submarine", 2)

    assert_equal "Submarine", submarine.name
  end

  def test_the_ship_length
    cruiser = Ship.new("Cruiser", 3)

    assert_equal 3, cruiser.length
  end

  def test_that_the_ship_can_have_a_different_length
    submarine = Ship.new("Submarine", 2)

    assert_equal 2, submarine.length
  end

  def test_initial_amount_of_health
    cruiser = Ship.new("Cruiser", 3)

    assert_equal 3, cruiser.health
  end

  def test_ship_has_sunk
    cruiser = Ship.new("Cruiser", 3)

    refute cruiser.sunk?
  end

  def test_health_is_impacted_by_a_hit
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    assert_equal 2, cruiser.health
  end
end
