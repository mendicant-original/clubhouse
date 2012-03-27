class CreateAdmissionQuestions < ActiveRecord::Migration
  def change
    create_table :admission_questions do |t|
      t.text :description
      t.integer :admission_id

      t.timestamps
    end
  end
end
