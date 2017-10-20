class CreateUserExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :user_experiences do |t|
      t.references :user, foreign_key: true
      t.references :experience, foreign_key: true

      t.timestamps
    end
  end
end
