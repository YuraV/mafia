class Game < ActiveRecord::Base

  attr_accessible :game_status, :result, :description, :manager

  has_many :users, :through => :appointments
  has_many :appointments
end