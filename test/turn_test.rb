require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/validation'
require './lib/turn'
require './lib/game'
require 'pry'

class TurnTest < Minitest::Test

  def test_it_exists
    turn = Turn.new

    assert_instance_of Turn, turn
  end

end
#
#   def test_it_can_create_a_ship
#     user = Player.new
#
#     user.create_ship("Cruiser", 3)
#
#     assert_instance_of Ship, user.create_ship("Cruiser", 3)
#
#     user.create_ship("Submarine", 2)
#
#     assert_instance_of Ship, user.create_ship("Submarine", 2)
#   end
#
#   def test_it_can_place_a_ship
#     user = Player.new
#     board = Board.new
#
#     user.create_ship("Cruiser", 3)
#     user.place_ship("Cruiser", ["A1", "A2", "A3"])
#
#     assert_equal "Cruiser", user.board.cell_hash["A1"].ship
#     assert_equal "Cruiser", user.board.cell_hash["A2"].ship
#     assert_equal "Cruiser", user.board.cell_hash["A3"].ship
#   end
#
#
