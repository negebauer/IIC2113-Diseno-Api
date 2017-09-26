# CreateRealizes
class CreateRealizes < ActiveRecord::Migration[5.1]
  def change
    create_table :realizes do |t|
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
