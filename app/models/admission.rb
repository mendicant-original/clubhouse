class Admission < ActiveRecord::Base
  
  validates_presence_of :title, :description, :limit
  validates_numericality_of :limit
  
  has_many :admission_questions
  
  accepts_nested_attributes_for :admission_questions, :reject_if => :all_blank, :allow_destroy => true
  
end
