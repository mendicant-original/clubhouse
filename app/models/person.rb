class Person < ActiveRecord::Base
  belongs_to :authorization
  belongs_to :group

  has_many :permissions, :dependent => :delete_all

  validates_presence_of   :name, :authorization_id
  validates_uniqueness_of :email
end
