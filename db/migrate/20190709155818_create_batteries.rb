class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.string :baterry_type
      t.string :status

      t.date :commissionning
      t.date :last_inspection
      t.binary :certificate #might have to change
      t.text :informations
      t.text :notes
    end
  end
end
