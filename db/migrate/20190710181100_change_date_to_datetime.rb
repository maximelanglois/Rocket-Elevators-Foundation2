class ChangeDateToDatetime < ActiveRecord::Migration[5.2]
  def change
    change_column :leads, :creation_date, :datetime
    change_column :batteries, :commissionning, :datetime
    change_column :customers, :creation_date, :datetime
    change_column :elevators, :commissionning, :datetime
    change_column :elevators, :last_inspection, :datetime
  end
end
