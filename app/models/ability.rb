# frozen_string_literal: true

Setting = 1

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?
    if user.is?(:churchman)
      can :manage, Person, person_id: user.person_id
      can :manage, TitleObtained, code: 1..4
      can :manage, Setting
      can :generate_meeting_assistance_report, TypeOfMeeting, id: user.person.meetings.where(active: true).pluck(:type_of_meeting_id)
    elsif user.is?(:admin)
      can :manage, :all
    end
  end
end
