class ChangeResources < ActiveRecord::Migration[5.1]
  def change
    change_table :resources do |t|
      t.rename :support, :how
      t.rename :disponibility, :available
    end
  end
end
