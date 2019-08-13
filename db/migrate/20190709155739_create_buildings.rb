class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|



      t.string :admin_name
      t.string :admin_email
      t.string :admin_phone
      t.string :name_service_contact
      t.string :email_service_contact
      t.string :phone_service_contact
    end
  end
end
