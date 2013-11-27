module ScoresHelper

  def red_score(user)
    Player.where(user_id: user.id, team: 'red', won: '1').count()
  end

  def black_score(user)
    Player.where(user_id: user.id, team: 'black', won: '1').count()
  end

  def won(user)
    black_score(user) + red_score(user)
  end

  def overall_games(user)
    Player.where(user_id: user.id).count()
  end

  def points(user)
    Player.where(user_id: user.id).sum(:score)
  end

  def ratio(user)
    if overall_games(user) != 0
      points(user)/overall_games(user).to_f
    end
  end

end
