class CreateUsers < ActiveRecord::Migration[6.0]
  def up
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.boolean :admin, null: false, default: false

      t.timestamps
    end

    User.create!(
      username: 'admin',
      password: 'admin123',
      password_confirmation: 'admin123',
      admin: true
    )
  end

  def down
    drop_table :users
  end
end
