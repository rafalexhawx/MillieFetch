class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.text :username
      t.text :password_digest

      t.timestamps
    end
  end
end
