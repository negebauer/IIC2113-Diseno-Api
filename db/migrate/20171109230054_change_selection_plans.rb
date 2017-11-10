class ChangeSelectionPlans < ActiveRecord::Migration[5.1]
  def change
    change_table :selection_plans do |t|
      t.string :reasons
    end
  end
end
