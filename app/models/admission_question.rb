class AdmissionQuestion < ActiveRecord::Base
  
  belongs_to :admission
  has_many :question_responses  
  
end
