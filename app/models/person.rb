class Person < ActiveRecord::Base
  belongs_to :authorization
  belongs_to :group

  has_many :permissions, :dependent => :delete_all

  validates_presence_of   :name, :authorization_id, :group_id
  validates_uniqueness_of :email

  def to_hash
    {
      name:            name,
      email:           email,
      group:           group.name,
      website:         website,
      membership_date: membership_date,
      github_uid:      authorization.uid,
      github_nickname: github_nickname,
      permissions:     permissions.to_hash
    }
  end
end
