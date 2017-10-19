class CreateSelectionPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :selection_plans do |t|
      t.references :plan, foreign_key: true
      t.references :selection, foreign_key: true

      t.timestamps
    end
  end
end
