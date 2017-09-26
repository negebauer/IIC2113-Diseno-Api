# CreatePlans
class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :name
      t.references :choice, foreign_key: true

      t.timestamps
    end
  end
end
