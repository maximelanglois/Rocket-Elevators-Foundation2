class AddDetailsToLeads < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :full_name, :string
    add_column :leads, :company_name, :string
    add_column :leads, :email, :string
    add_column :leads, :phone, :string
    add_column :leads, :project_name, :string
    add_column :leads, :project_description, :string
    add_column :leads, :department, :string
    add_column :leads, :message, :string
    add_column :leads, :attachment_file, :binary   
    add_column :leads, :creation_date, :date

  end
end
