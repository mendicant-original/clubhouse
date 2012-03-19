class PeopleController < ApplicationController

  # The index action will correspond to the search page
  def index
  end

  def show
    person = Person.find_by_github_nickname(params[:id])

    respond_to do |format|
      format.json do
        render :json => person.to_hash
      end
    end
  end

  def edit
    @person = Person.find_by_github_nickname(params[:id])
  end

  def update

  end

  def destroy

  end

  # People are created in two ways:
  # 1. Through the admissions form
  # 2. Bulk import from the previous system
  #
  # In the future, this may be possible - for example to invite someone
  # to the community.
  def new
    redirect_to :index, :notice =>
      'It is not currently possible to create People this way.'
  end

end
