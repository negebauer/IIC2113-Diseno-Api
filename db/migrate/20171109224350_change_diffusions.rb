class ChangeDiffusions < ActiveRecord::Migration[5.1]
  def change
    change_table :diffusions do |t|
      t.remove :before
      t.remove :during
      t.remove :after
      t.text :audience_before
      t.text :channel_before
      t.text :objective_before
      t.text :audience_during
      t.text :channel_during
      t.text :objective_during
      t.text :audience_after
      t.text :channel_after
      t.text :objective_after
    end
  end
end
