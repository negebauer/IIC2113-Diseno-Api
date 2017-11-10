class RemoveNameFromPlan < ActiveRecord::Migration[5.1]
  def change
    change_table :plans do |t|
      t.remove :name
    end
  end
end
