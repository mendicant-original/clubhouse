class Admission < ActiveRecord::Base
  validates_presence_of :title, :description, :limit
  validates_numericality_of :limit
end
