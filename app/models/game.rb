class Game < ActiveRecord::Base

  attr_accessible :user_id, :game_status, :result, :description, :description

end