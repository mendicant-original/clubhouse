require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  def setup
  end

  test "to_hash returns a hash of the person's attributes" do
    person = Factory(:person)
    assert person.to_hash.kind_of?(Hash)
  end

  test "saves properly without a website" do
    begin
      Factory(:person, :website => nil)
      pass
    rescue NoMethodError
      fail 'Empty website broke save'
    end
  end
end
