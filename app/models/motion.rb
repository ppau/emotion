class Motion < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  def author
    user
  end
end
