class Round < ActiveRecord::Base

  has_many :appointments

  belongs_to :game

  accepts_nested_attributes_for :appointments

  attr_accessible :appointment_id, :game_id, :kill, :vote, :user_id, :round_number


end
