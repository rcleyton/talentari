class DropCompaniesTable < ActiveRecord::Migration[8.0]
  def up
    drop_table :companies, if_exists: true
  end

  def down
    create_table :companies do |t|
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps
    end
  end
end
