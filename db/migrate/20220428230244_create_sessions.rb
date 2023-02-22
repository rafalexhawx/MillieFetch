class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.text "otp_hash"
      t.text "login_hash"
      t.text "session_hash"
      t.timestamps
    end
  end
end
