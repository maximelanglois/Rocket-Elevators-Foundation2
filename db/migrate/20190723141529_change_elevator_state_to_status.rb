class ChangeElevatorStateToStatus < ActiveRecord::Migration[5.2]

  change_table :elevators do |t|
    t.rename :state, :status
  end
end
