class Person < ActiveRecord::Base
  before_save :clean_website

  belongs_to :authorization
  belongs_to :group

  has_many :permissions, :dependent => :delete_all

  validates_presence_of   :name, :authorization_id, :group_id
  validates_uniqueness_of :email

  after_create do
    authorization = Authorization.find_by_nickname(github_nickname)

    authorization.update_attribute(:person_id, id) if authorization
  end

  def to_hash
    {
      name:            name,
      email:           email,
      email_hash:      email_hash,
      group:           group.name,
      website:         website,
      membership_date: membership_date,
      github_uid:      authorization.uid,
      github_nickname: github_nickname,
      permissions:     permissions.to_hash
    }
  end

  def email_hash
    Digest::MD5.hexdigest(email.downcase) if email
  end

  private

  def clean_website
    # Remove http(s):// from the front of the website
    self.website = website.gsub(/\Ahttp[s]?:\/\//i, '')

    # Remove any trailing slashes
    self.website = website.gsub(/\/\z/, '')
  end
end
