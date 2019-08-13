class AddDetailsToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :address_type, :string
    add_column :addresses, :status, :string
    add_column :addresses, :entity, :string
    add_column :addresses, :number_and_street, :string
    add_column :addresses, :unit, :string
    add_column :addresses, :city, :string
    add_column :addresses, :postal_code, :string
    add_column :addresses, :country, :string
    add_column :addresses, :notes, :string

  end
end
