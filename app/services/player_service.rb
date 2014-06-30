class PlayerService
  BLACK_TEAM = %w(don mafia).freeze
  class << self
    def set_team(options)
      options.each {|player|
        if player.role.in?(BLACK_TEAM)
          team = 'black'
        else
          team = 'red'
        end
        player.update_attribute(:team, team)
      }
    end
  end
end
