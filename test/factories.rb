FactoryGirl.define do
  factory(:person) do
    sequence(:name)             { |n| "foo bar #{n}" }
    sequence(:email)            { |n| "person#{n}@example.com" }
    sequence(:github_nickname)  { |n| "person#{n}" }

    website         'example.com'
    membership_date  Date.today
    time_zone        'GMT'

    group
    authorization
  end

  factory(:group) do
    sequence(:name) { |n| "group #{n}" }
  end

  factory(:authorization) do
    sequence(:uid)
    sequence(:name)       { |n| "authorization #{n}" }
    sequence(:email)      { |n| "foo#{n}@example.com" }
    sequence(:nickname)   { |n| "auth_name_#{n}" }
    sequence(:token)      { |n| "token#{n}" }
  end

  factory(:resource) do
    sequence(:name) { |n| "resource #{n}" }
  end

  factory(:role) do
    sequence(:name) { |n| "role #{n}" }
  end
end
