class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :alias, :role_ids
  # attr_accessible :title, :body

  has_many :players
  has_many :games, :through => :appointments


  has_many :managers


  has_many :player_roles
  has_many :game_roles, through: :player_roles

  after_create :set_permission!

  def self.search(search)
    if search
      where('alias LIKE ? OR name LIKE ?',"%#{search}%", "%#{search}%")
    else
      scoped
    end
  end

  def set_permission!
    self.add_role 'player'
  end

end
