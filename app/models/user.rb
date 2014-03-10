class User < ActiveRecord::Base

  ROLES = [
    ADMIN = 'admin',
    GUEST = 'guest',
    BANNED = 'banned',
  ]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :group_memberships
  has_many :groups, through: :group_memberships

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validate :role, inclusion: { in: ROLES, allow_nil: true }

  def self.guest
    User.new(role: GUEST)
  end

  def admin?
    role == ADMIN
  end

  private

  before_create :add_example_group

  def add_example_group
    groups << Group.example
  end
end
