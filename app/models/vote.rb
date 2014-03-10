class Vote < ActiveRecord::Base

  RESPONSES = [
    YES = 'yes',
    NO = 'no',
    ABSTAIN = 'abstain',
  ]

  belongs_to :user
  belongs_to :motion

  validates :user, presence: true
  validates :motion, presence: true
  validates :response, inclusion: { in: RESPONSES, allow_nil: true }

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
