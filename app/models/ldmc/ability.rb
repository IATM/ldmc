module Ldmc
  class Ability
    include ::CanCan::Ability

    def initialize(user)
      return if user.nil?

      can :manage, Subject
      can :manage, ReadGeneral
      can :manage, ReadSequence
      can :manage, Lesion
    end
  end
end
