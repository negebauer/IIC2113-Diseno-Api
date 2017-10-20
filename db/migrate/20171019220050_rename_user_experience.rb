class RenameUserExperience < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_experiences, :experience_users
  end
end
