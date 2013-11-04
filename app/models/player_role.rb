class PlayerRole < ActiveRecord::Base



  attr_accessible :user_id, :game_role_id

  belongs_to :game




end
