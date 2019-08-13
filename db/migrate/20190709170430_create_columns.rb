class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|

      t.string :column_type
      t.integer :served_floors
      t.string :state
      t.text :infos
      t.text :notes
    end
  end
end
