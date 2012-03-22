require 'test_helper'

describe "Admissions integration" do

  before do
  end

  describe "Create admission" do

    describe "success" do
      before do
        visit root_path
        fill_in 'title', :with => 'Core Skills course'
        fill_in 'description', :with => 'Lorem ipsum dolor sit amet, consectetur...'
        click_button 'Save'
      end

      it "notifies of the success" do
        page.should have_content('Admission page created')
      end
      
    end
  end
end