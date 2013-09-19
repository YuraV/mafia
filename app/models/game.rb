class Game < ActiveRecord::Base


  attr_accessible :game_status, :result, :description, :game_manager, :appointments_attributes, :best_player

  attr_accessor :game_manager
  attr_accessor :gamer

  has_many :appointments, dependent: :destroy
  has_many :users, :through => :appointments

  has_one :manager, dependent: :destroy

  accepts_nested_attributes_for :appointments


  after_create :create_manager

  validates :description, presence: true

  def create_manager
    if game_manager
      Manager.create(user_id: self.game_manager, game_id: self.id)
    end
  end

  def status_open?
     self.game_status == 'open'
  end

  def game_result
    self.result
  end


end