class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|

      t.string :serial_number
      t.string :model
      t.string :elevator_type
      t.string :state
      t.date :commissionning
      t.date :last_inspection
      t.binary :certificate
      t.text :infos
      t.text :notes
    end
  end
end
