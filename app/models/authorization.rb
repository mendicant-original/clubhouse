class Authorization < ActiveRecord::Bas
  has_one :person

  before_create do
    person = Person.find_by_github_nickname(nickname)

    self.person_id = person.id if person
  end

  def self.find_or_create_from_hash(auth_hash)
    authorization = where(uid: auth_hash['uid'])

    return authorization.first if authorization.any?

    authorization.create(
      name:     auth_hash['info']['name'],
      nickname: auth_hash['info']['nickname'],
      email:    auth_hash['info']['email'],
      token:    auth_hash['credentials']['token']
    )
  end
end
