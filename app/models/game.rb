#require 'services/reference'
class Game < ActiveRecord::Base
  resourcify


  attr_accessible :game_status, :result, :description, :game_manager, :players_attributes, :best_player, :game_ref,:first_killed_sherif

  attr_accessor :game_manager
  attr_accessor :gamer

  has_many :players, dependent: :destroy

  has_many :users, :through => :appointments

  has_many :rounds

  has_many :player_roles

  has_one :manager, dependent: :destroy

  accepts_nested_attributes_for :players

  before_create :generate_game_ref
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

  def generate_game_ref
    ::ReferenceService.new(self).create_reference!
  end

  extend FriendlyId
  friendly_id :game_ref

  def self.search(search)
    if search
      where('result LIKE ? OR best_player LIKE ? ', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end

end
