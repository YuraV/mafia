class Game < ActiveRecord::Base

  attr_accessible :game_status, :result, :description, :game_manager
  attr_accessor :game_manager
  attr_accessor :gamer

  has_many :appointments, dependent: :destroy
  has_many :users, :through => :appointments

  has_one :manager, dependent: :destroy


  after_create :create_manager

  def create_manager
    if game_manager
      Manager.create(user_id: self.game_manager, game_id: self.id)
    end
  end

end