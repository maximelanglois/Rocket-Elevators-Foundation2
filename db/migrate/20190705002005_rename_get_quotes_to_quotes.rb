class RenameGetQuotesToQuotes < ActiveRecord::Migration[5.2]
  def change
    rename_table :get_quotes, :quotes
  end
end
