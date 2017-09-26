# CreateEvaluates
class CreateEvaluates < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluates, &:timestamps
  end
end
