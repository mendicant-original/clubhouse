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
    @submission = @admission.submissions.new(params[:submission])    
    
    @person = Person.new(:authorization_id => '2343',
      :group_id => '123123',
      :email => params[:person][:email],
      :website => params[:person][:website],
      :name => params[:person][:name])
    @person.save
      
    @submission.person = @person

    @admission.save
  end
end
