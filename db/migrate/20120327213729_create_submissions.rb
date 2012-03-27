class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :admission_id
      t.integer :person_id

      t.timestamps
    end
  end
end
