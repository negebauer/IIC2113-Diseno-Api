# CreateDifussions
class CreateDifussions < ActiveRecord::Migration[5.1]
  def change
    create_table :difussions do |t|
      t.string :name
      t.string :description
      t.string :path
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
