require 'test_helper'

describe "Admissions integration" do

  before do
  end

  describe "Create admission" do
    let(:admission) { Factory.build(:admission) }
    
    before { visit root_path }

    describe "success" do

      before do
        fill_in_admission_form(admission)
      end

      it "notifies of the success" do
        page.must_have_content('Admission page created')
      end
    end

    describe "failure" do
      before do
      end

      it "Fails without a title" do
        admission.title = ''
        fill_in_admission_form(admission)
        page.must_have_content("Title can't be blank")
      end

      it "Fails without a description" do
        admission.description = ''
        fill_in_admission_form(admission)
        page.must_have_content("Description can't be blank")
      end

      it "Fails without a limit" do
        admission.limit = ''
        fill_in_admission_form(admission)
        page.must_have_content("Limit can't be blank")
      end

      it "Fails when limit is not a number" do
        fill_in 'Limit', :with => 'high'
        click_button 'Create Admission'

        page.must_have_content("Limit is not a number")
      end

    end
  end

  def fill_in_admission_form(admission)
    fill_in 'Title', :with => admission.title
    fill_in 'Description', :with => admission.description
    fill_in 'Limit', :with => admission.limit
    click_button 'Create Admission'
  end
end