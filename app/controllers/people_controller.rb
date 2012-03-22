class PeopleController < ApplicationController
  before_filter :find_person, :except => [:index]
  before_filter :decorate_person, :only => [:show, :edit]

  # The index action will correspond to the search page
  def index
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @person.to_hash }
    end
  end

  def edit
  end

  def update
    if @person.update_attributes(params[:person])
      redirect_to edit_person_path(@person), :notice =>
        "Successfully updated information for #{@person.github_nickname}"
    else
      flash[:alert] = "Unable to update #{@person.github_nickname}"
      decorate_person
      render :edit
    end
  end

  def destroy
    @person.destroy

    redirect_to people_url, :notice =>
      "#{@person.github_nickname} has been permenantly deleted"
  end

  # People are created in two ways:
  # 1. Through the admissions form
  # 2. Bulk import from the previous system
  #
  # In the future, this may be possible - for example to invite someone
  # to the community.
  def new; end

  private

  # Finds the Person by their github_nickname
  #
  # Returns the Person instance associated with the given github_nickname or
  # raises a RecordNotFound exception.
  def find_person
    @person = Person.find_by_github_nickname!(params[:id])
  end

  def decorate_person
    @person = PersonDecorator.new(@person)
  end
end
