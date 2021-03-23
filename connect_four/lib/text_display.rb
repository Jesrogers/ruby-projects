module TextDisplay
  def player_turn_prompt(player)
    puts "#{player.name}'s turn! Which column would you like to drop a piece in?"
  end

  def player_input_error
    puts "Please choose a column labeled 1-7 that isn't full"
  end

  def board_full_message
    puts 'Draw - the board is full!'
  end
end
