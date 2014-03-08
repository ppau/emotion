class Motion < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  has_many :votes

  def author
    user
  end
end
