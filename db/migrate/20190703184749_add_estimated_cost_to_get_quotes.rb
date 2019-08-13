class AddEstimatedCostToGetQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :get_quotes, :shafts_required, :integer
    add_column :get_quotes, :total_cost, :integer
  end
end
