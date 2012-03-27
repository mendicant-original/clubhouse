class SubmissionsController < ApplicationController
  def new
    @admission = Admission.find(params[:admission_id])
    @submission = Submission.new
    @admission.admission_questions.each do |admission_question|  
      @submission.question_responses.new(:admission_question_id => admission_question.id)
    end    
  end

  def create
    @admission = Admission.find(params[:admission_id])
    @admission.submissions.new(params[:submission])    
    @admission.save
  end
end
