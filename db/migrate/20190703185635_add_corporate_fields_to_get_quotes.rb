class AddCorporateFieldsToGetQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :get_quotes, :businesses, :integer
    add_column :get_quotes, :max_nb_occ_by_floor, :integer
  end
end
