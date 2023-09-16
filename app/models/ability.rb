class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    # Define rules for entities
    can :create, Entity
    can %i[update read destroy], Entity, author_id: user.id

    # Define rules for groups
    can :create, Group
    can %i[update read destroy], Group, creator_id: user.id

    # Additional rules for other actions like :update and :destroy if needed
    # For example, allow users to update and destroy their own entities
    can :update, Entity, author_id: user.id
    can :destroy, Entity, author_id: user.id

    # Add any other rules based on your application's requirements

    if user.admin?
      can :manage, :all # Admins can manage all resources
    end
  end
end
