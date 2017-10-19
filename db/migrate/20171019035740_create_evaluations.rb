class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.references :implement, foreign_key: true

      t.timestamps
    end
  end
end
