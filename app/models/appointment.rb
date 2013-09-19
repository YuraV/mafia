class Appointment < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  attr_accessible :user_id, :game_id, :id, :role, :team, :player_number


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

  def set_score!
    if game.result == 'red'
      if self.team == 'red' && self.role == 'sherif'
        self.update_attribute(:score, '4' )
      elsif self.team == 'red'
        self.update_attribute(:score, '3' )
      end
    elsif game.result == 'black' && self.team == 'black'
      if self.team == 'black' && self.role == 'Don'
        self.update_attribute(:score, '5')
      elsif team == 'black'
        self.update_attribute(:score, '4')
      end
    else
      self.update_attribute(:score, '0' )
    end
  end
end