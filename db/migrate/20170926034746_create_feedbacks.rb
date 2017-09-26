# CreateFeedbacks
class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.string :message
      t.string :type
      t.references :realize, foreign_key: true

      t.timestamps
    end
  end
end
