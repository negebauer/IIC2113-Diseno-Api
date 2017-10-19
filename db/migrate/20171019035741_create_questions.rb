class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :conect
      t.text :choice
      t.text :planing
      t.text :implements
      t.references :evaluation, foreign_key: true

      t.timestamps
    end
  end
end
