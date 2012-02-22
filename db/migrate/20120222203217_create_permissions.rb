class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.belongs_to :person
      t.belongs_to :resource
      t.belongs_to :role

      t.timestamps
    end
  end
end
