class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.text :where
      t.text :indentify
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
