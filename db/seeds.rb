User.create!(admin: 1, first_name: 'AdminFirst', last_name: 'AdminLast', title: 'admin', email:'admin@admin.com', password:'admin123', created_at: Date.today, updated_at: Date.today)
User.create!(admin: 1, first_name: 'Nicolas', last_name: 'Genest', title: 'Comm Rep', email:'nicolas.genest@codeboxx.biz', password:'admin123', created_at: Date.today, updated_at: Date.today)
User.create!(admin: 1, first_name: 'Philippe', last_name: 'Bouillon', title: 'Engineer', email:'philippe.bouillon@codeboxx.biz', password:'admin123', created_at: Date.today, updated_at: Date.today)
User.create!(admin: 1, first_name: 'David', last_name: 'Boutin', title: 'Engineer', email:'david.boutin@codeboxx.biz', password:'admin123', created_at: Date.today, updated_at: Date.today)
User.create!(admin: 1, first_name: 'Remi', last_name: 'Gagnon', title: 'Engineer', email:'remi.gagnon@codeboxx.biz', password:'admin123', created_at: Date.today, updated_at: Date.today)
User.create!(admin: 1, first_name: 'Mathieu', last_name: 'LeFrancois', title: 'Engineer', email:'mathieu.lefrancois@codeboxx.biz', password:'admin123', created_at: Date.today, updated_at: Date.today)
User.create!(admin: 1, first_name: 'Mathieu', last_name: 'Lortie', title: 'Engineer', email:'mathieu.lortie@codeboxx.biz', password:'admin123', created_at: Date.today, updated_at: Date.today)
User.create!(admin: 1, first_name: 'Mathieu', last_name: 'Houde', title: 'Engineer', email:'mathieu.houde@codeboxx.biz', password:'admin123', created_at: Date.today, updated_at: Date.today)
User.create!(admin: 1, first_name: 'Serge', last_name: 'Savoie', title: 'Engineer', email:'serge.savoie@codeboxx.biz', password:'admin123', created_at: Date.today, updated_at: Date.today)
User.create!(admin: 1, first_name: 'Nadya', last_name: 'Fortier', title: 'Director', email:'nadya.fortier@codeboxx.biz', password:'admin123', created_at: Date.today, updated_at: Date.today)

User.create!(admin: 1, first_name: 'Maxime', last_name: 'Langlois', title: 'Employee', email:'maxmaxmax@hotmail.com', password:'maxmaxmax', created_at: Date.today, updated_at: Date.today)
User.create!(admin: 1, first_name: 'Marie', last_name: 'Labrecque', title: 'Employee', email:'marie.labrecque@codeboxx.biz', password:'admin123', created_at: Date.today, updated_at: Date.today)
User.create!(admin: 1, first_name: 'Joe', last_name: 'Blo', title: 'Employee', email:'joe.blo@codeboxx.biz', password:'admin123', created_at: Date.today, updated_at: Date.today)
User.create!(admin: 1, first_name: 'John', last_name: 'Blo', title: 'Employee', email:'john.blo@codeboxx.biz', password:'admin123', created_at: Date.today, updated_at: Date.today)
User.create!(admin: 1, first_name: 'Jane', last_name: 'Blo', title: 'Employee', email:'jane.blo@codeboxx.biz', password:'admin123', created_at: Date.today, updated_at: Date.today)
User.create!(admin: 1, first_name: 'Carl', last_name: 'Blo', title: 'Employee', email:'carl.blo@codeboxx.biz', password:'admin123', created_at: Date.today, updated_at: Date.today)
User.create!(admin: 1, first_name: 'Daryl', last_name: 'Blo', title: 'Employee', email:'daryl.blo@codeboxx.biz', password:'admin123', created_at: Date.today, updated_at: Date.today)
User.create!(admin: 1, first_name: 'Edith', last_name: 'Blo', title: 'Employee', email:'edith.blo@codeboxx.biz', password:'admin123', created_at: Date.today, updated_at: Date.today)
User.create!(admin: 1, first_name: 'Ginette', last_name: 'Blo', title: 'Employee', email:'ginette.blo@codeboxx.biz', password:'admin123', created_at: Date.today, updated_at: Date.today)
User.create!(admin: 1, first_name: 'Gerard', last_name: 'Blo', title: 'Employee', email:'gerard.blo@codeboxx.biz', password:'admin123', created_at: Date.today, updated_at: Date.today)

Employee.create!(first_name: 'admin', last_name: 'admin', email:'admin@admin.com', user_id: 1)
Employee.create!(first_name: 'Nicolas', last_name: 'Genest', email:'nicolas.genest@codeboxx.biz', user_id: 2)
Employee.create!(first_name: 'Philippe', last_name: 'Bouillon', email:'philippe.bouillon@codeboxx.biz', user_id: 3)
Employee.create!(first_name: 'David', last_name: 'Boutin', email:'david.boutin@codeboxx.biz', user_id: 4)
Employee.create!(first_name: 'Remi', last_name: 'Gagnon', email:'remi.gagnon@codeboxx.biz', user_id: 5)
Employee.create!(first_name: 'Mathieu', last_name: 'LeFrancois', email:'mathieu.lefrancois@codeboxx.biz', user_id: 6)
Employee.create!(first_name: 'Mathieu', last_name: 'Lortie', email:'mathieu.lortie@codeboxx.biz', user_id: 7)
Employee.create!(first_name: 'Mathieu', last_name: 'Houde', email:'mathieu.houde@codeboxx.biz', user_id: 8)
Employee.create!(first_name: 'Serge', last_name: 'Savoie', email:'serge.savoie@codeboxx.biz', user_id: 9)
Employee.create!(first_name: 'Nadya', last_name: 'Fortier', email:'nadya.fortier@codeboxx.biz', user_id: 10)
Employee.create!(first_name: 'Maxime', last_name: 'Langlois', email:'maxmaxmax@hotmail.com', user_id: 11)
Employee.create!(first_name: 'Marie', last_name: 'Labrecque', email:'marie.labrecque@codeboxx.biz', user_id: 12)
Employee.create!(first_name: 'Joe', last_name: 'Blo', email:'joe.blo@codeboxx.biz', user_id: 13)
Employee.create!(first_name: 'John', last_name: 'Blo', email:'john.blo@codeboxx.biz', user_id: 14)
Employee.create!(first_name: 'Jane', last_name: 'Blo', email:'jane.blo@codeboxx.biz', user_id: 15)
Employee.create!(first_name: 'Carl', last_name: 'Blo', email:'carl.blo@codeboxx.biz', user_id: 16)
Employee.create!(first_name: 'Daryl', last_name: 'Blo', email:'daryl.blo@codeboxx.biz', user_id: 17)
Employee.create!(first_name: 'Edith', last_name: 'Blo', email:'edith.blo@codeboxx.biz', user_id: 18)
Employee.create!(first_name: 'Ginette', last_name: 'Blo', email:'ginette.blo@codeboxx.biz', user_id: 19)
Employee.create!(first_name: 'Gerard', last_name: 'Blo', email:'gerard.blo@codeboxx.biz', user_id: 20)

BlazerQuery.create!(statement: "SELECT to_char(creation_date, 'Month') AS Month, to_char(creation_date, 'YYYY') AS Year,COUNT(*) FROM fact_contacts group by 1, 2 order by year ASC", name: "Customers by creation date (Month/year);", data_source: "main")
BlazerQuery.create!(statement: "SELECT to_char(commissionning_date, 'Month') AS Month, to_char(commissionning_date, 'YYYY') AS Year,COUNT(*) FROM fact_elevators group by 1, 2 order by year ASC", name: "Elevator by creation date (Month/year);", data_source: "main")
BlazerQuery.create!(statement: "SELECT to_char(creation_date, 'month') as month, to_char(creation_date, 'YYYY') AS Year, count(*) FROM fact_quotes GROUP BY month, year ORDER BY year DESC", name: "Quotes by creation date (Month/year);", data_source: "main")
BlazerQuery.create!(statement: "SELECT customer_id, nb_elevators from dim_customers group by 1,2 order by to_number(dim_customers.customer_id, '999999999') ASC", name: "Number of elevator per customer;", data_source: "main")
BlazerQuery.create!(statement: "SELECT employee_id, CAST(elevator_id AS INT) FROM fact_intervention WHERE elevator_id != '' group by 1,2 order by 1,2  ASC", name: "fact_intervention_test;", data_source: "main")

#/********************** address_full.csv ********************************/
require 'csv'

Address.skip_callback(:create, :after, :get_lat_lng)

csv_text = File.read(Rails.root.join('lib', 'seeds', 'address_full.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    t = Address.new
    t.created_at = row['created_at']
    t.updated_at = row['updated_at']
    t.address_type = row['address_type']
    t.status = row['status']
    t.entity = row['entity']
    t.number_and_street= row['number_and_street']
    t.unit = row['unit']
    t.city = row['city']
    t.postal_code = row['postal_code']
    t.country = row['country']
    t.notes = row['notes']
    t.lat = row['lat']
    t.lng = row['lng']
    t.save!
    puts "#{t.created_at}, #{t.number_and_street} saved"
  end
  puts "There are now #{Address.count} rows in the Address table"

  Address.set_callback(:create, :after, :get_lat_lng)

#/********************** user_customer.csv ********************************/

  csv_text = File.read(Rails.root.join('lib', 'seeds', 'user_customer.csv'))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
  csv.each do |row|
      t = User.new
      t.created_at = row['created_at']
      t.updated_at = row['updated_at']
      t.first_name = row['first_name']
      t.last_name = row['last_name']
      t.email = row['email']
      t.password = row['password']
      t.admin = 0
      t.title = 'Customer'
      t.save!
      puts "#{t.created_at}, #{t.first_name} saved"
    end
    puts "There are now #{User.count} rows in the Users table"

#/********************** customers_full.csv ********************************/


csv_text = File.read(Rails.root.join('lib', 'seeds', 'customers_full.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    c = Customer.new
    c.creation_date = row['creation_date']
    c.business_name = row['business_name']
    c.contact_name = row['contact_name']
    c.contact_phone = row['contact_phone']
    c.email_contact = row['email_contact']
    c.business_description = row['business_descrition']
    c.name_service_contact = row['name_service_contact']
    c.phone_service_contact = row['phone_service_contact']
    c.email_service_contact = row['email_service_contact']
    c.user_id = row['user_id']
    c.address_id = row['address_id']
    c.save!
    puts "#{c.creation_date}, #{c.business_name} saved"
  end
  puts "There are now #{Customer.count} rows in the Customer table"

#/********************** building_full.csv ********************************/

csv_text = File.read(Rails.root.join('lib', 'seeds', 'buildings_full.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    c = Building.new
    c.admin_name = row['admin_name']
    c.admin_email = row['admin_email']
    c.admin_phone = row['admin_phone']
    c.name_service_contact = row['name_service_contact']
    c.email_service_contact = row['email_service_contact']
    c.phone_service_contact = row['phone_service_contact']
    c.address_id = row['address_id']
    c.customer_id = row['customer_id']
    c.battery_id = row['battery_id']
    c.save!
    puts "#{c.admin_name}, #{c.admin_email} saved"
  end
  puts "There are now #{Building.count} rows in the building table"



#/********************** buildingDetails_full.csv ********************************/


csv_text = File.read(Rails.root.join('lib', 'seeds', 'buildingsDetails_full.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    c = BuildingDetail.new
    c.information_key = row['information_key']
    c.value = row['value']
    c.building_id = row['building_id']
    c.save!
    puts "#{c.information_key}, #{c.value} saved"
  end
  puts "There are now #{BuildingDetail.count} rows in the Bulding Detail table"


#/********************** batteries_full.csv ********************************/



csv_text = File.read(Rails.root.join('lib', 'seeds', 'batteries_full.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    b = Battery.new
    b.baterry_type = row['baterry_type']
    b.status = row['status']
    b.commissionning = row['commissionning']
    b.last_inspection = row['last_inspection']
    b.certificate = row['certificate']
    b.informations = row['informations']
    b.notes = row['notes']
    b.building_id = row['building_id']
    b.employee_id = row['employee_id']
    b.column_id = row['column_id']
    b.save!
    puts "#{b.baterry_type}, #{b.commissionning} saved"
  end
  puts "There are now #{Battery.count} rows in the Battery table"


#/********************** column_full.csv ********************************/


csv_text = File.read(Rails.root.join('lib', 'seeds', 'columns_full.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    c = Column.new
    c.column_type = row['column_type']
    c.served_floors = row['served_floors']
    c.status = row['state']
    c.infos = row['infos']
    c.notes = row['notes']
    c.battery_id = row['batterie_id']
    c.save!
    puts "#{c.column_type}, #{c.status} saved"
  end
  puts "There are now #{Column.count} rows in the Column table"



#/********************** elevators_full.csv ********************************/


csv_text = File.read(Rails.root.join('lib', 'seeds', 'elevators_full.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    e = Elevator.new
    e.serial_number = row['serial_number']
    e.model = row['model']
    e.elevator_type = row['elevator_type']
    e.status = row['status']
    e.commissionning = row['commissionning']
    e.last_inspection = row['last_inspection']
    e.certificate = row['certificate']
    e.infos = row['infos']
    e.notes = row['notes']
    e.column_id = row['column_id']
    e.customer_id = row['column_id']
    e.save!
    puts "#{e.serial_number}, #{e.model}, #{e.column_id} saved"
  end
  puts "There are now #{Elevator.count} rows in the Elevator table"


#/********************** Leads_full.csv ********************************/


csv_text = File.read(Rails.root.join('lib', 'seeds', 'leads_full.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    # puts row.to_hash
    t = Lead.new
    t.full_name = row['full_name']
    t.company_name = row['company_name']
    t.email = row['email']
    t.phone = row['phone']
    t.project_name = row['project_name']
    t.project_description = row['project_description']
    t.department = row['department']
    t.message = row['message']
    t.creation_date = row['creation_date']
    t.save!
    puts "#{t.full_name}, #{t.email} saved"
  end
  puts "There are now #{Lead.count} rows in the Lead table"

  

#/********************** Quotes_full.csv ********************************/

Quote.skip_callback(:create, :after, :zendesk_quote)

csv_text = File.read(Rails.root.join('lib', 'seeds', 'quotes_full.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    # puts row.to_hash
    t = Quote.new
    t.created_at = row['created_at']
    t.updated_at = row['updated_at']
    t.project_type = row['project_type']
    t.product_range = row['product_range']
    t.appartments = row['appartments']
    t.floors= row['floors']
    t.underground_floors = row['underground_floors']
    t.shafts_required = row['shafts_required']
    t.total_cost = row['total_cost']
    t.stores_and_shops = row['stores_and_shops']
    t.elevator_shafts_required = row['elevator_shafts_required']
    t.businesses = row['businesses']
    t.max_nb_occ_by_floor = row['max_nb_occ_by_floor']
    t.business_hours = row['business_hours']
    t.save!
    puts "#{t.created_at}, #{t.project_type} saved"
  end
  puts "There are now #{Quote.count} rows in the Quote table"

  Quote.set_callback(:create, :after, :zendesk_quote)

  #/********************** Intervention.csv ********************************/

csv_text = File.read(Rails.root.join('lib', 'seeds', 'intervention.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    t = Intervention.new
    t.column_id = row['column_id']
    t.elevator_id = row['elevator_id']
    t.intervention_start_date = row['intervention_start_date']
    t.intervention_end_date = row['intervention_end_date']
    t.intervention_result = row['intervention_result']
    t.intervention_report = row['intervention_report']
    t.intervention_status = row['intervention_status']
    t.employee_id = row['employee_id']
    t.building_id = row['building_id']
    t.battery_id = row['battery_id']
    t.author = row['author']
    t.customer_id = row['customer_id']
  
    t.save!
    puts "#{t.intervention_start_date}, #{t.intervention_result} saved"
  end
  puts "There are now #{Intervention.count} rows in the Intervention table"