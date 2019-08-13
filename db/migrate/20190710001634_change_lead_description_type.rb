class ChangeLeadDescriptionType < ActiveRecord::Migration[5.2]
  def change
    change_column :leads, :project_description, :text
    change_column :leads, :message, :text
  end
end
