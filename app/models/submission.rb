class Submission < ActiveRecord::Base
  
  belongs_to :admission
  belongs_to :person
  
  has_many :question_responses
  
  accepts_nested_attributes_for :question_responses, :reject_if => :all_blank, :allow_destroy => true
  
end
