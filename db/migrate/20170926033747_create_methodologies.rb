# CreateMethodologies
class CreateMethodologies < ActiveRecord::Migration[5.1]
  def change
    create_table :methodologies do |t|
      t.string :name
      t.string :description
      t.string :video
      t.string :link

      t.timestamps
    end
  end
end
