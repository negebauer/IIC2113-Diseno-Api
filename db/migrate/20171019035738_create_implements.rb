class CreateImplements < ActiveRecord::Migration[5.1]
  def change
    create_table :implements do |t|
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
