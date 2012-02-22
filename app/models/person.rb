class Person < ActiveRecord::Base
  belongs_to :authorization
  belongs_to :group

  validates_presence_of   :name, :authorization_id
  validates_uniqueness_of :email
end
