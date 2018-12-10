require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/validation'
require './lib/turn'
require './lib/game'
require 'pry'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_it_can_create_a_board
    game = Game.new

    assert_instance_of Board, game.board
  end

  def test_computer_create_ships
    # skip
    game = Game.new

    assert_instance_of Ship, game.computer_cruiser
    assert_instance_of Ship, game.computer_submarine
    assert_instance_of Ship, game.human_cruiser
    assert_instance_of Ship, game.human_submarine
  end

  def test_computer_can_place_ships
    game = Game.new
    game.board.place(computer_cruiser, ["A1", "A2", "A3"])


    assert_equal computer_cruiser, board.cell_hash["A1"].ship
  end

end
