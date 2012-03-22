class AdmissionsController < ApplicationController
  
  def new
    @admission = Admission.new
  end
  
end
