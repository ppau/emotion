class Group < ActiveRecord::Base
  include UuidHelper

  has_many :group_memberships
  has_many :users, through: :group_memberships
end
