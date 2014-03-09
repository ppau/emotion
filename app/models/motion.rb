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

  private

  before_create :setup_votes

  def setup_votes
    self.votes.build group.users.map{|u| {user: u} }
  end
end
