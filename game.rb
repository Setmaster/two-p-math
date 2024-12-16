class Game
  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player_index = 0
  end

  def play
    while both_players_alive?
      current_player = @players[@current_player_index]
      question = Question.new

      puts "#{current_player.name}: #{question.ask_question}"
      $stdout.flush # Ensure the output is displayed immediately
      print "> "
      $stdout.flush # Ensure the output is displayed immediately
      answer = gets.chomp

      if question.correct?(answer)
        puts "Correct!"
      else
        puts "Incorrect! The correct answer was #{question.answer}."
        current_player.lose_life
      end

      display_scores
      switch_turn
    end

    announce_winner
  end

  private

  def both_players_alive?
    @players.all?(&:alive?)
  end

  def switch_turn
    @current_player_index = (@current_player_index + 1) % 2
  end

  def display_scores
    @players.each do |player|
      puts "#{player.name}: #{player.lives} lives remaining"
    end
    $stdout.flush # Ensure the output is displayed immediately after scores
  end

  def announce_winner
    winner = @players.find(&:alive?)
    puts "#{winner.name} wins with #{winner.lives} lives remaining!"
    $stdout.flush # Ensure the output is displayed immediately after announcing the winner
  end
end
