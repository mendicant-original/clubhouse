class QuestionResponse < ActiveRecord::Base
  
  belongs_to :admission_question
  belongs_to :submission
  
end
