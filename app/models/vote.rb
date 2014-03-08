class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :motion

  validate :user, presence: true
  validate :motion, presence: true
  validate :response, inclusion: { in: %w(yea nay abstain) }
end
