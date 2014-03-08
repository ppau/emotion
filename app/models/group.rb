class Group < ActiveRecord::Base
  include UuidHelper

  has_many :group_memberships
  has_many :users, through: :group_memberships
  has_many :motions

  validates :name, presence: true
end
