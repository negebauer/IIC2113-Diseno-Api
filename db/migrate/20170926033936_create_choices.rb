# CreateChoices
class CreateChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :choices do |t|
      t.string :reasons
      t.references :selection, foreign_key: true

      t.timestamps
    end
  end
end
