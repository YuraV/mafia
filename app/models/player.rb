class Player < ActiveRecord::Base
  resourcify

  belongs_to :game
  belongs_to :user

  PLAYER_ROLE = ['don','mafia','sheriff','citizen'].freeze
  PLAYER_TEAM = ['red', 'black'].freeze

  attr_accessible :user_id, :game_id, :id, :role, :team, :player_number, :remark
  validates :user_id, presence: true
  validates :role, :inclusion => { :in => PLAYER_ROLE }, on: :update
  validates :team, :inclusion => { :in => PLAYER_TEAM }, on: :update

  delegate :result_black?, :result_red?, to: :game

  #def methods  is_don? is_mafia? is_sheriff? is_citizen?
  PLAYER_ROLE.each do |type|
    define_method("is_#{type}?") {role.to_s == type}
  end


  #def methods team_red? team_black?
  PLAYER_TEAM.each do |type|
    define_method("team_#{type}?") {team.to_s == type}
  end

  def set_team!
    if is_don? || is_mafia?
      update_attribute(:team, 'black')
    else
      update_attribute(:team, 'red')
    end
  end

  def opts
    if is_mafia?
      { system_email:         'app@onapp.com',
        system_support_email: 'support@onapp.com',
        system_host:          'onapp.com'
      }.any? { |opt, val| OnApp.configuration.send(opt) == val }
    end
  end


  def set_score!
    if game.result_red?
      if team_red? && is_sheriff?
        update_attribute(:score, 4 )
      elsif team_red?
        update_attribute(:score, 3 )
      elsif team_black? && is_don?
        update_attribute(:score, -1)
      elsif team_black?
        update_attribute(:score, 0 )
      end
    elsif game.result_black?
      if team_black? && is_don?
        update_attribute(:score, 5)
      elsif team_black?
        update_attribute(:score, 4)
      elsif team_red? && is_sheriff? && !game.first_killed_sheriff
        update_attribute(:score, -1)
      elsif team_red?
        update_attribute(:score, 0)
      end
    else
      update_attribute(:score, 0 )
    end
  end

  def won!
    if game.result_red?
      if team_red?
        update_attribute(:won, true)
      elsif team_black?
        update_attribute(:won, false)
      end
    elsif game.result_black?
      if team_red?
        update_attribute(:won, false)
      elsif team_black?
        update_attribute(:won, true)
      end
    end
  end
end
