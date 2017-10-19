class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.references :implement, foreign_key: true
      t.date :day_before
      t.text :change
      t.date :day_after
      t.text :obs
      t.text :advances
      t.text :obstacles
      t.text :ideas

      t.timestamps
    end
  end
end
