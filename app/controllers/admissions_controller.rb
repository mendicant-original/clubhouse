class AdmissionsController < ApplicationController
  
  def new
    @admission = Admission.new
  end

  def create
    @admission = Admission.new params[:admission]
    
    if @admission.save
      redirect_to root_path, :notice => 'Admission page created'
    else
      render :new
    end
  end
end
