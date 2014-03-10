class Motion < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  has_many :votes

  validates :name, presence: true, length: { minimum: 1, maximum: 100 }
  validates :group, presence: true
  validates :user, presence: true

  def to_param
    [id, name.parameterize].join('-')
  end

  def author
    user
  end

  def vote_for_user(user)
    votes.where(user_id: user.id).first
  end

  def includes_user?(user)
    vote_for_user(user).present?
  end

  def voted?(user)
    vote_for_user(user).response.present?
  end

  def num_votes_yes
    votes.where(response: 'yes').count
  end

  def num_votes_no
    votes.where(response: 'no').count
  end

  def num_votes_abstain
    votes.where(response: 'abstain').count
  end

  def percent_complete
    (100.0 * votes.filled.count.to_f / votes.count.to_f).round(2)
  end

  private

  before_create :setup_votes

  def setup_votes
    self.votes.build group.users.map{|u| {user: u} }
  end
end
