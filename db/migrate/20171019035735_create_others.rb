class CreateOthers < ActiveRecord::Migration[5.1]
  def change
    create_table :others do |t|
      t.string :item
      t.text :how
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
