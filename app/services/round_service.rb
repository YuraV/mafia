class RoundService

  attr_reader :game, :round

  def initialize(game, round)
    @game = game
    @round = round
  end

  def create_round!
    game_round = 1
    loop do
      unless @game.rounds.where(round_number: game_round).exists?
        round.round_number = game_round + 1
      end
    end
  end
end