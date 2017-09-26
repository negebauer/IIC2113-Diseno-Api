# CreateGoals
class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :when
      t.string :how
      t.string :description
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
