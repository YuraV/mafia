class Game < ActiveRecord::Base

  attr_accessible :game_status, :result, :description, :game_manager, :gamer
  attr_accessor :game_manager
  attr_accessor :gamer

  has_many :appointments
  has_many :users, :through => :appointments

  has_one :manager, dependent: :destroy


  after_create :create_manager
  after_create :create_appointment
  after_create :game_status

  def create_manager
    if game_manager
      Manager.create(user_id: self.game_manager, game_id: self.id)

    end
  end

  def game_status
    Game.create(game_status: 'open')
  end

  def create_appointment 
    Appointment.create(game_id: self.id, user_id: self.gamer)
  end

end