# CreateExperiences
class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.string :name
      t.date :date
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
