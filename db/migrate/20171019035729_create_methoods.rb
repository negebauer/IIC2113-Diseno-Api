class CreateMethoods < ActiveRecord::Migration[5.1]
  def change
    create_table :methoods do |t|
      t.string :name
      t.text :description
      t.string :video
      t.string :link

      t.timestamps
    end
  end
end
