class PlayerScoreService

  class << self

    def set_score(game, &player)
      if game.result_red?
        if team_red? && is_sheriff?
              score = 4
        elsif team_red?
          score = 3
        elsif team_black? && is_don?
          score -1
        elsif team_black?
          score = 0
        end
      elsif game.result_black?
        if team_black? && is_don?
          score = 5
        elsif team_black?
          score = 4
        elsif team_red? && is_sheriff? && !game.first_killed_sheriff
          score = -1
        elsif team_red?
          score = 0
        end
      else
        score = 0
      end
      player.score = score
    end

  end
end