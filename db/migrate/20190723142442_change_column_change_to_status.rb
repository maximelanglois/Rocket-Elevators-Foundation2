class ChangeColumnChangeToStatus < ActiveRecord::Migration[5.2]

    change_table :columns do |t|
      t.rename :state, :status

  end
end
