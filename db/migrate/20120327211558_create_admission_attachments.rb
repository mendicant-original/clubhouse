class CreateAdmissionAttachments < ActiveRecord::Migration
  def change
    create_table :admission_attachments do |t|
      t.text :description
      t.integer :admission_id

      t.timestamps
    end
  end
end
