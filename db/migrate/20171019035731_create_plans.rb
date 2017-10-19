class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.text :reasons
      t.text :period
      t.string :name
      t.text :objetive

      t.timestamps
    end
  end
end
