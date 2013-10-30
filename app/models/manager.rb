class Manager < ActiveRecord::Base

  attr_accessible :user_id, :game_id

  belongs_to :user
  belongs_to :game

end
