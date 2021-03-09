class Player
  attr_accessor :name, :marker

  def initialize(name = '', marker = '')
    @name = name
    @marker = marker
  end

  def choose_cell
    cell = gets.strip.to_i
  end

  def valid_cell?(cell)
    if cell.between?(1, 9)
      true
    else
      puts 'Please enter a valid cell number'
    end
  end
end
