class Appointment < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  attr_accessible :user_id, :game_id, :id, :role, :team


  validates :user_id, presence: true


  def set_team!
    if self.role == 'Don'
      self.update_attribute(:team, 'black')
    elsif self.role == 'mafia'
      self.update_attribute(:team, 'black')
    else
      self.update_attribute(:team, 'red')
    end

  end

end