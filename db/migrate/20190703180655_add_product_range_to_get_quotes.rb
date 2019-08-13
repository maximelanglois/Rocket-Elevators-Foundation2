class AddProductRangeToGetQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :get_quotes, :product_range, :string
  end
end
