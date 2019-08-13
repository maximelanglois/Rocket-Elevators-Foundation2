class Addsomecolumnstocolumns < ActiveRecord::Migration[5.2]
  def change
    add_column :batteries, :column_id, :int
    add_column :buildings, :battery_id, :int
  end
end
