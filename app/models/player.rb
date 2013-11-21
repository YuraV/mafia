class Player < ActiveRecord::Base
  resourcify

  belongs_to :game
  belongs_to :user

  attr_accessible :user_id, :game_id, :id, :role, :team, :player_number, :remark
  validates :user_id, presence: true

  PLAYER_ROLE = ['Don','mafia','sherif','citizen',]

  #def methods  is_don? is_mafia? is_sherif? is_citizen?
  PLAYER_ROLE.each do |type|
    define_method("is_#{type}?") {role.to_s == type}
  end



  def set_team!

    if self.is_Don?
      self.update_attribute(:team, 'black')

    elsif self.is_mafia?
      self.update_attribute(:team, 'black')

    else
      self.update_attribute(:team, 'red')
    end

  end

  def set_score!
    if game.result == 'red'
      if self.team == 'red' && self.role == 'sherif'
        self.update_attribute(:score, 4 )
      elsif self.team == 'red'
        self.update_attribute(:score, 3 )
      elsif self.team =='black' && self.role =='Don'
        self.update_attribute(:score, -1)
      elsif self.team =='black'
        self.update_attribute(:score, 0 )
      end
    elsif game.result == 'black'
      if self.team == 'black' && self.role == 'Don'
        self.update_attribute(:score, 5)
      elsif team == 'black'
        self.update_attribute(:score, 4)
      elsif team == 'red' && self.role == 'sherif' && !game.first_killed_sherif
        self.update_attribute(:score, -1)
      elsif team == 'red'
        self.update_attribute(:score, 0)
      end
    else
      self.update_attribute(:score, 0 )
    end
  end

  def won!
    if game.result == 'red'
      if self.team == 'red'
        self.update_attribute(:won, true)
      elsif self.team == 'black'
        self.update_attribute(:won, false)
      end
    elsif game.result == 'black'
      if self.team == 'red'
        self.update_attribute(:won, false)
      elsif self.team == 'black'
        self.update_attribute(:won, true)
      end
    end
  end

end
