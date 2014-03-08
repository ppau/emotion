class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :motion

  validate :user, presence: true
  validate :motion, presence: true
  validate :response, inclusion: { in: %w(yea nay abstain) }

  def display_response
    case response
    when /yea/i
      'yea'
    when /nay/i
      'nay'
    when /abstain/i
      'abstain'
    else
      'pending'
    end
  end
end
