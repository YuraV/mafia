class GameRole < ActiveRecord::Base

  attr_accessible :name

  belongs_to :game
  belongs_to :user

end
