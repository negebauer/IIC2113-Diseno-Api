class AddPlanToGoals < ActiveRecord::Migration[5.1]
  def change
    change_table :goals do |t|
      t.references :plan, foreign_key: true
    end
  end
end
