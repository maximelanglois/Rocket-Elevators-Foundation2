class AddHybridFieldsToGetQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :get_quotes, :business_hours, :integer
  end
end
