class Person < ActiveRecord::Base
  before_save :clean_website

  belongs_to :authorization
  belongs_to :group

  has_many :permissions, :dependent => :delete_all

  accepts_nested_attributes_for :permissions, :allow_destroy => true,
    :reject_if => proc{|attrs| attrs.any?{|key,val| val.blank?}}

  validates_presence_of   :email, :github_nickname, :group_id, :name
  validates_uniqueness_of :email, :github_nickname

  def to_param
    self.github_nickname
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

  def build_permissions
    (Resource.all - permissions.all.map(&:resource)).each do |resource|
      permissions.new(:resource => resource)
    end
    permissions.sort_by!{|p| p.resource.name}
  end

  private

  def clean_website
    if attribute_present?(:website)
      # Remove http(s):// from the front of the website
      self.website = website.gsub(/\Ahttp[s]?:\/\//i, '')

      # Remove any trailing slashes
      self.website = website.gsub(/\/\z/, '')
    end
  end
end
