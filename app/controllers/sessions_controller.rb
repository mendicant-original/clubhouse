class SessionsController < ApplicationController

  def create
    authorization = Authorization.find_or_create_from_hash(auth_hash)

    if authorization.person
      self.current_person = authorization.person
      render :text => "Nice job #{current_person.name}!"
    else
      render :text => "Nice job buddy!"
    end
  end

  private

  def auth_hash
    hash = request.env['omniauth.auth']
    hash['uid'] = hash['uid'].to_s

    hash
  end

end
