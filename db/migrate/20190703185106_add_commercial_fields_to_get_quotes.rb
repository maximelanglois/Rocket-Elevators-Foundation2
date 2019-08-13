class AddCommercialFieldsToGetQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :get_quotes, :stores_and_shops, :integer
    add_column :get_quotes, :parking_spaces, :integer
    add_column :get_quotes, :elevator_shafts_required, :integer
  end
end
