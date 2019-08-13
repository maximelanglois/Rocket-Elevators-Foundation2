class AddProjectTypeToGetQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :get_quotes, :project_type, :string
  end
end
