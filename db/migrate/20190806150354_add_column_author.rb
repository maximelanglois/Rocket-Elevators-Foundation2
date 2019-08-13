class AddColumnAuthor < ActiveRecord::Migration[5.2]
  def change
    add_column :interventions, :author, :int
    add_column :interventions, :customer_id, :int
  end
end
