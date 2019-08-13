class AddResidentialFieldsToGetQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :get_quotes, :appartments, :integer
    add_column :get_quotes, :floors, :integer
    add_column :get_quotes, :underground_floors, :integer
  end
end
