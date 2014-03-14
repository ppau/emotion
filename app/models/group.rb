class Group < ActiveRecord::Base
  include UuidHelper

  has_many :memberships, class_name: 'GroupMembership'
  has_many :users, through: :memberships
  has_many :motions

  accepts_nested_attributes_for :users

  validates :name, presence: true
  validates :quorum_percentage, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  EXAMPLE_NAME = 'Example'

  def self.example
    @example_group ||= find_by_name!(EXAMPLE_NAME)
  end

  def self.create_example!
    create!(name: EXAMPLE_NAME)
  end
end
