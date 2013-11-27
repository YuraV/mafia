module GamesHelper
  def games_action(g)
    actions = {}
      actions[:show] = link_to 'Show', game_path(g), class:'btn'
      actions[:edit] = link_to 'Edit', edit_game_path(g), class:'btn'
      actions[:destroy] = link_to 'Destroy', game_path(g), method: :delete,class:'btn btn-danger'
    render "shared/actions", :object => g, :actions => actions
  end

  def user_alias_by_player(player)
    user = User.find(player.user_id)
  if player.player_number
    "##{player.player_number}. #{user.alias} "
  else
    "#{user.alias}"
    end
  end

  def player_name_or_alias(player)
    if player.user.alias
    "#{player.user.alias},"
    else
      "#{player.user.name}"
    end
  end
end
