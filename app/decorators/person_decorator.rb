class PersonDecorator < Draper::Base
  decorates :person

  def permissions
    permissions = person.permissions.all

    (Resource.all - permissions.map(&:resource)).each do |resource|
      permissions << person.permissions.new(:resource => resource)
    end

    permissions.sort_by{|p| p.resource.name}
  end
end
