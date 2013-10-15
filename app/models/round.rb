class Round < ActiveRecord::Base

  has_many :appointments

  belongs_to :game

  accepts_nested_attributes_for :appointments

  attr_accessible :appointment_id, :game_id, :kill, :vote, :user_id, :round_number


  #before_save :create_round!
  #before_create :generate_game_ref

  #def generate_game_ref
  #  ::RoundService.new(game, self).create_round!
  #end

  #def create_round!
  #  game_round = 1
  #  if  @game.rounds.where(round_number: game_round)
  #    game_round + 1
  #    self.round_number = game_round
  #  else
  #    self.round_number = game_round
  #  end
  #end


end
