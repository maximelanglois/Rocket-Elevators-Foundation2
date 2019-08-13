class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|

      t.date :creation_date
      t.string :business_name
      t.string :contact_name
      t.string :contact_phone
      t.string :email_contact
      t.string :business_description
      t.string :name_service_contact
      t.string :phone_service_contact
      t.string :email_service_contact
    end
  end
end
