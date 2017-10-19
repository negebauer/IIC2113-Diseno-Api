class CreateComunicates < ActiveRecord::Migration[5.1]
  def change
    create_table :comunicates do |t|
      t.references :evaluation, foreign_key: true

      t.timestamps
    end
  end
end
