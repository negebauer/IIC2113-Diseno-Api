class ChangePlan < ActiveRecord::Migration[5.1]
  def change
    change_table :plans do |t|
      t.remove :reasons
      t.remove :period
      t.remove :objetive
    end
  end
end
