module Ldmc
  class Ability
    include ::CanCan::Ability

    def initialize(user)
      return if user.nil?

      if user.has_role? :admin
        can :manage, :all

      elsif user.has_role? :radiologo
        can [:index, :read, :update], Subject
        can [:index, :read, :update], ReadSequence
        can :manage, Lesion

      else
        can [:read, :update], User, :id => user.id
        cannot :index, User
      end
    end
  end
end
