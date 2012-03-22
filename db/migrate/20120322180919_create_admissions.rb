class CreateAdmissions < ActiveRecord::Migration
  def change
    create_table :admissions do |t|
      t.text       :title
      t.text       :description
      t.boolean    :open
      t.date       :closed_on
      t.integer    :limit

      t.timestamps
    end
  end
end
