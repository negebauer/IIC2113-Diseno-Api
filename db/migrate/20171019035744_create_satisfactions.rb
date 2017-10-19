class CreateSatisfactions < ActiveRecord::Migration[5.1]
  def change
    create_table :satisfactions do |t|
      t.references :evaluation, foreign_key: true

      t.timestamps
    end
  end
end
