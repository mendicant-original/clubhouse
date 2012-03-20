require 'test_helper'

describe Person do
  before do
    let(:person) { Factory(:person) }
  end

  describe "to_param" do
    it "returns the github nickname" do
      tom = Factory(:person, :github_nickname => 'mojombo')
      tom.to_param.must_equal 'mojombo'
    end
  end

  it "does not raise a NoMethodError when website is nil" do
    begin
      Factory(:person, :website => nil)
      pass
    rescue NoMethodError
      fail 'Empty website broke save'
    end
  end
end
