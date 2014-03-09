class Vote < ActiveRecord::Base

  RESPONSES = [
    YES = 'yes',
    NO = 'no',
    ABSTAIN = 'abstain',
  ]

  belongs_to :user
  belongs_to :motion

  validate :user, presence: true
  validate :motion, presence: true
  validate :response, inclusion: { in: RESPONSES }

  scope :filled, -> { where('response is not null') }

  def yes?
    response == YES
  end

  def no?
    response == NO
  end

  def abstain?
    response == ABSTAIN
  end
end
