# CreateSurveys
class CreateSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table :surveys do |t|
      t.string :title
      t.references :evaluate, foreign_key: true

      t.timestamps
    end
  end
end
