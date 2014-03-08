class Motion < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  has_many :votes

  validates :text, presence: true, length: { minimum: 100, maximum: 10_000 }
  validates :group, presence: true
  validates :user, presence: true

  def author
    user
  end
end
