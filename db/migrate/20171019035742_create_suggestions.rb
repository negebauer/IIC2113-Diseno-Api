class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.references :evaluation, foreign_key: true
      t.text :result

      t.timestamps
    end
  end
end
