module Player::Score

  def set_score!
    if game.result_red?
      if team_red?
        score = is_sheriff? ? 4 : 3
      elsif team_black?
        score = is_don? ? -1 : 0
      end
    elsif game.result_black?
      if team_black? &&
        score = is_don? ? 5 : 4
      elsif is_sheriff? && game.first_killed_sheriff
        score = -1
      elsif team_red?
        score = 0
      end
    end
    update_attribute(:score, score)
  end

  def set_team!
    (is_don? || is_maffia?) ? team = "black" : team = "red"
    update_attribute(:team, team)
  end

  def won!
    game.result_red? ? red_winner : black_winner
  end

  private

  def red_winner
    team_red? ? flag = true : flag = false
    update_attribute(:won, flag)
  end

  def black_winner
    team_red? ? flag = false : flag = true
    update_attribute(:won, flag)
  end
end