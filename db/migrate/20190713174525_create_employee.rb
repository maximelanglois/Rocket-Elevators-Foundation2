class CreateEmployee < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
    end
  end
end
