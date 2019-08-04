class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  set_current_tenant_through_filter
  before_action :set_church_man

  def set_church_man
    person = current_user.person
    set_current_tenant(person)
  end
end
