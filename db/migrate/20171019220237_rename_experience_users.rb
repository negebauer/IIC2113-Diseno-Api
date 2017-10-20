class RenameExperienceUsers < ActiveRecord::Migration[5.1]
  def change
    rename_table :experience_users, :experiences_users
  end
end
