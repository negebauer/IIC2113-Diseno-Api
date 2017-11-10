class AddExperienceToPlans < ActiveRecord::Migration[5.1]
  def change
    change_table :plans do |t|
      t.references :experience, foreign_key: true
    end
  end
end
