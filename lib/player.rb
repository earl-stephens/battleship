require './lib/ship'
require './lib/cell'
require 'pry'

class Player
  def create_ship(name, length)
    name = Ship.new(name, length)
  end
end
