class Group < ActiveRecord::Base
  has_many :people

  validates_presence_of   :name
  validates_uniqueness_of :name
end
