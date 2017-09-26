# CreateSelections
class CreateSelections < ActiveRecord::Migration[5.1]
  def change
    create_table :selections do |t|
      t.string :applicable
      t.string :usefulness
      t.string :relevance
      t.string :feasibility
      t.references :experience, foreign_key: true
      t.references :methodologies, foreign_key: true

      t.timestamps
    end
  end
end
