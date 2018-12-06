require 'pry'

class Board
  attr_reader :cell_hash,
              :key_array

  def initialize
    @cell_hash = {}
    @key_array = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
  end

  def cells
    @key_array.each do |key|
      @cell_hash[key] = Cell.new(key)
    end
    # binding.pry
    return @cell_hash
  end

  def valid_coordinate?(coordinate_arg)
    @key_array.any? {|key| key == coordinate_arg}
  end

end
