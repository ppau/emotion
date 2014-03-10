class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.guest

    if user.admin?
      can :manage, :all
      return
    end

    can :read, Motion do |m| user.groups.include?(m.group) end
    can :read, Group do |g| user.groups.include?(g) end
  end
end
