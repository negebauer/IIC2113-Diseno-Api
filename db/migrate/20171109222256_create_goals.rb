class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :name
      t.string :description
      t.string :when
      t.string :how

      t.timestamps
    end
  end
end
