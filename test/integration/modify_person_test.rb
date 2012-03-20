require 'test_helper'

describe "Modify person integration" do

  let(:person) { Factory(:person, :github_nickname => 'mojombo') }

  describe "update a person's basic attributes" do

    describe "success" do
      before do
        visit edit_person_path(person)
        fill_in 'Email', :with => 'tom@github.com'
        click_button 'Save'
      end

      it "notifies of the success" do
        flash_message_present?('notice', 'Successfully updated information for mojombo').must_equal true
      end

      it "redirects to the edit page" do
        current_path.must_equal edit_person_path(person)
      end

      it "correctly reflects the changes in the database" do
        Person.find_by_github_nickname('mojombo').email.must_equal 'tom@github.com'
      end
    end

    describe "failure" do
      before do
        visit edit_person_path(person)
        fill_in 'Email', :with => ''
        click_button 'Save'
      end

      it "notifies of the errors" do
        flash_message_present?('alert', 'Unable to update mojombo').must_equal true
      end

      it "explains the error" do
        page.has_content?("Email can't be blank").must_equal true
      end
    end
  end

  describe "destroy a person" do
    before do
      visit edit_person_path(person)
      click_link 'Destroy'
    end

    it "requests confirmation" do
      # I hate alerts, this should instead be some kind of confirmation 
      # div that is added by JavaScript"
    end

    describe "confirmed" do
      before do
        # click_button 'Confirm'
      end

      it "redirects to the person index" do
        current_path.must_equal people_path
      end

      it "notifies of successful deletion" do
        flash_message_present?('notice', 'mojombo has been permenantly deleted').must_equal true
      end

      it "removes the person from the database" do
        Person.find_by_github_nickname('mojombo').must_be_nil
      end
    end

    describe "cancelled" do
      it "hides the confirm button" do
        # click_link 'Cancel'
        # page.has_button?('Confirm').must_equal false
      end
    end
  end
end
