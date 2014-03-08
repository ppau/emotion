class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :group_memberships
  has_many :groups, through: :group_memberships

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }

  private

  before_create :add_example_group

  def add_example_group
    groups << example_group
  end

  def example_group
    @example_group ||= Group.find_by_name!('Example')
  end
end
