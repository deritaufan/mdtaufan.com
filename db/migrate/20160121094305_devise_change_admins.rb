class DeviseChangeAdmins < ActiveRecord::Migration
  def change
    change_table(:admins) do |t|
      t.remove :reset_password_token, :reset_password_sent_at, :remember_created_at
      
      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at
      
      add_index :admins, :unlock_token,         unique: true
    end
  end
end
