class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate_arg)
    @coordinate = coordinate_arg
    @ship = nil
  end

  def empty?
    if @ship == nil
    return true
    end
  end

end
