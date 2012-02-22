class PeopleController < ApplicationController

  def show
    person = Person.find_by_github_nickname(params[:id])

    respond_to do |format|
      format.json do
        render :json => {
          name:            person.name,
          email:           person.email,
          group:           person.group.name,
          website:         person.website,
          membership_date: person.membership_date
        }
      end
    end
  end

end
