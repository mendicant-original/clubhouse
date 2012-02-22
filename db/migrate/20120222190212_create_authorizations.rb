class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :uid
      t.string :name
      t.string :email
      t.string :nickname
      t.string :token

      t.timestamps
    end
  end
end
