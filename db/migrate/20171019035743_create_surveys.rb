class CreateSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table :surveys do |t|
      t.references :evaluation, foreign_key: true
      t.text :result

      t.timestamps
    end
  end
end
