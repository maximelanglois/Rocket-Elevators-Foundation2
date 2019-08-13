class CreateGetQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :get_quotes do |t|
      t.string :email
      t.string :company_name
      t.timestamps
    end
  end
end
