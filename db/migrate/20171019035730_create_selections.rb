class CreateSelections < ActiveRecord::Migration[5.1]
  def change
    create_table :selections do |t|
      t.text :applicable
      t.text :usefulness
      t.text :relevance
      t.text :feasibility
      t.references :experience, foreign_key: true
      t.references :methood, foreign_key: true

      t.timestamps
    end
  end
end
