class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.belongs_to :authorization

      t.string :name
      t.string :email
      t.string :github_nickname
      t.string :website
      t.date   :membership_date

      t.timestamps
    end
  end
end
