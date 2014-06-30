class Player < ActiveRecord::Base
  include Score
  resourcify

  belongs_to :game
  belongs_to :user

  PLAYER_ROLE = ['don','mafia','sheriff','citizen'].freeze
  PLAYER_TEAM = ['red', 'black'].freeze

  attr_accessible :user_id, :game_id, :id, :role, :team, :player_number, :remark, :kill, :nominate
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
end
