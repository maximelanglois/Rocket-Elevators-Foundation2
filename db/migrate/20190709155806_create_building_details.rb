class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :building_details do |t|


      t.string :information_key #to be changed
      t.string :value #to be changed
    end
  end
end
