class AddForeignkey < ActiveRecord::Migration[5.2]
  
  change_table :interventions do |t|
    t.remove :column_id, :elevator_id
  end
  def change
    add_reference :interventions, :column, foreign_key: true
    add_reference :interventions, :elevator, foreign_key: true
  end
end
