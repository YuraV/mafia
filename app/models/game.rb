#require 'services/reference'
class Game < ActiveRecord::Base
  resourcify

  extend FriendlyId
  friendly_id :game_ref

  attr_accessible :game_status, :result, :description, :game_manager, :players_attributes, :best_player, :game_ref, :first_killed_sheriff

  attr_accessor :game_manager

  has_many :players, dependent: :destroy
  has_many :users, :through => :players
  has_one :manager, dependent: :destroy

  accepts_nested_attributes_for :players

  before_create :generate_game_ref
  after_create :create_manager

  validates :description, presence: true

  GAME_RESULT = ['red', 'black'].freeze
  #def methods result_black? result_red?
  GAME_RESULT.each do |type|
    define_method("result_#{type}?") {result.to_s == type}
  end

  def create_manager
    if game_manager
      Manager.create(user_id: self.game_manager, game_id: self.id)
    end
  end

  def status_open?
     game_status == 'open'
  end

  def game_result
    result
  end

  def generate_game_ref
    ::ReferenceService.new(self).create_reference!
  end

  class << self
    def search(search)
      if search
        where('result LIKE ? OR best_player LIKE ? ', "%#{search}%", "%#{search}%")
      else
        scoped
      end
    end
  end
end
