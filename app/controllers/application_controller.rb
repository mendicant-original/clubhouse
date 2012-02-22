class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_person

  private

  def current_person
    @current_person ||= Person.find_by_id(session[:person_id])
  end

  def current_person=(person)
    @current_person = person
    session[:person_id] = person.try(:id)
  end
end
