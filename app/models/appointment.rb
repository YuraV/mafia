class Appointment < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  attr_accessible :user_id, :game_id, :id


  validates :user_id, presence: true

end