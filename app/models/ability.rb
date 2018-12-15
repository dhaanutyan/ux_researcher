class Ability
  include CanCan::Ability

  def initialize(admin)
    can :access, :rails_admin
    can :read, :dashboard

    can :manage, User
    can :manage, SurveyTemplate
    can :manage, Survey

    cannot [:edit, :update], Survey
  end
end
