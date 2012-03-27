class CreateQuestionResponses < ActiveRecord::Migration
  def change
    create_table :question_responses do |t|
      t.text :answer
      t.integer :admission_question_id
      t.integer :submission_id

      t.timestamps
    end
  end
end
