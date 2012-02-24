class PeopleController < ApplicationController

  def show
    person = Person.find_by_github_nickname(params[:id])

    respond_to do |format|
      format.json do
        render :json => person.to_hash
      end
    end
  end

end
