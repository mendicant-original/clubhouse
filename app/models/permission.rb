class Permission < ActiveRecord::Base
  belongs_to :person
  belongs_to :resource
  belongs_to :role

  validates_presence_of :person, :resource, :role

  def self.to_hash
    Hash[all.map {|p| [p.resource.name, p.role.name] }]
  end
end
