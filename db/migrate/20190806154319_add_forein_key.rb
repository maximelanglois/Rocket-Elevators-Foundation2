class AddForeinKey < ActiveRecord::Migration[5.2]
  change_table :interventions do |t|
    t.remove :customer_id
  end
  def change
    add_reference :interventions, :customer, foreign_key: true
  end
end
