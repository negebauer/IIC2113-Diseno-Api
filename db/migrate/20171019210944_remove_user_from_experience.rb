class RemoveUserFromExperience < ActiveRecord::Migration[5.1]
  def change
    remove_reference :experiences, :user, index: true, foreign_key: true
  end
end
