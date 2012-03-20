class PeopleController < ApplicationController
  # The index action will correspond to the search page
  def index
  end

  def show
    @person = find_person_from_params

    respond_to do |format|
      format.html
      format.json { render json: @person.to_hash }
    end
  end

  def edit
    @person = PersonDecorator.new(find_person_from_params)
  end

  def update
    @person = find_person_from_params

    params[:person][:permissions_attributes].each do |key,val|
      val["_destroy"] = true if val["role_id"] == ""
    end

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html do
          redirect_to edit_person_path(@person), :notice =>
            "Successfully updated information for #{@person.github_nickname}"
        end
        format.json do
          head :no_content
        end
      else
        format.html do
          @person = PersonDecorator.new(@person)
          flash[:alert] = "Unable to update #{@person.github_nickname}"
          render :edit
        end
        format.json do
          render :json => @person.errors, :status => :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @person = find_person_from_params
    @person.destroy

    respond_to do |format|
      format.html do
        redirect_to people_url, :notice =>
          "#{@person.github_nickname} has been permenantly deleted"
      end
      format.json do
        head :no_content
      end
    end
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
  def find_person_from_params
    Person.find_by_github_nickname!(params[:id])
  end
end
