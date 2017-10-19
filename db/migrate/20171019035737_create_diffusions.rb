class CreateDiffusions < ActiveRecord::Migration[5.1]
  def change
    create_table :diffusions do |t|
      t.text :before
      t.text :during
      t.text :after
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
