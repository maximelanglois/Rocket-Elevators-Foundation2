namespace :pg_task do
    task sync: :environment do
      connection = PG::Connection.new(host:'codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com',port:'5432',dbname:'maximelanglois',user:'codeboxx',password:'Codeboxx1!')
      #connection = PG::Connection.new(host: "localhost",port:'5432',dbname:'postgres',user:'postgres',password:'root')
      #connection = PG::Connection.new(host: "localhost",port:'5433',dbname:'maxmaxmax',user:'maxmaxmax',password:'maxmaxmax')
      #connection = PG::Connection.new(host:'localhost',port:'5433',dbname:'postgres',user:'postgres',password:'postgres')

      connection.exec("DROP TABLE IF EXISTS public.dim_customers CASCADE")
      connection.exec("DROP TABLE IF EXISTS public.fact_contacts CASCADE")
      connection.exec("DROP TABLE IF EXISTS public.fact_elevators CASCADE")
      connection.exec("DROP TABLE IF EXISTS public.fact_quotes CASCADE")
      connection.exec("DROP TABLE IF EXISTS public.customers CASCADE")
      connection.exec("DROP TABLE IF EXISTS public.buildings CASCADE")
      connection.exec("DROP TABLE IF EXISTS public.fact_intervention CASCADE")
      
      

  
      connection.exec("CREATE TABLE public.buildings (address varchar(255) NULL DEFAULT NULL::character varying,
      admin_name varchar(255) NULL DEFAULT NULL::character varying,
      admin_email varchar(255) NULL DEFAULT NULL::character varying,
      admin_phone varchar(255) NULL DEFAULT NULL::character varying,
      name_service_contact varchar(255) NULL DEFAULT NULL::character varying,
      email_service_contact varchar(255) NULL DEFAULT NULL::character varying,
      phone_service_contact varchar(255) NULL DEFAULT NULL::character varying,
      building_id serial NOT NULL,CONSTRAINT buildings_pk PRIMARY KEY (building_id))")

     
  
      connection.exec("CREATE TABLE public.customers (customer_id serial NOT NULL,
        creation_date date NULL,
        business_name varchar(255) NULL DEFAULT NULL::character varying,
        address varchar(255) NULL DEFAULT NULL::character varying,
        contact_name varchar(255) NULL DEFAULT NULL::character varying,
        contact_phone varchar(255) NULL DEFAULT NULL::character varying,
        email_contact varchar(255) NULL DEFAULT NULL::character varying,
        business_description varchar(255) NULL DEFAULT NULL::character varying,
        name_service_contact varchar(255) NULL DEFAULT NULL::character varying,
        phone_service_contact varchar(255) NULL DEFAULT NULL::character varying,
        email_service_contact varchar(255) NULL DEFAULT NULL::character varying,
        CONSTRAINT customers_pkey PRIMARY KEY (customer_id))")
    
  
      connection.exec("CREATE TABLE public.fact_quotes (creation_date date NULL,
        company_name varchar NULL,
        email varchar NULL,
        nb_elevator int4 NULL,
        quote_id serial NOT NULL,
        CONSTRAINT fact_quotes_pk PRIMARY KEY (quote_id))")
    
  
      connection.exec("CREATE TABLE public.fact_elevators (elevator_id serial NOT NULL,
        serial_number varchar(255) NULL,
        building_id int4 NULL,
        customer_id int4 NULL,
        building_city varchar NULL,
        commissionning_date date NULL,
        CONSTRAINT fact_elevator_pk PRIMARY KEY (elevator_id),
        CONSTRAINT building_id FOREIGN KEY (building_id) REFERENCES buildings(building_id) MATCH FULL,
        CONSTRAINT customer_id FOREIGN KEY (customer_id) REFERENCES customers(customer_id) MATCH FULL)")
   
  
      connection.exec("CREATE TABLE public.fact_contacts (company_name varchar NULL,email varchar NULL,
        project_name varchar NULL,
        contact_id serial NOT NULL,
        creation_date date NULL,
        CONSTRAINT fact_contact_pk PRIMARY KEY (contact_id))")
    
      
      connection.exec("CREATE TABLE public.dim_customers (dim_customer_id serial NOT NULL,
        company_name varchar NULL,
        full_name_company_contact varchar NULL,
        email_company_contact varchar NULL,
        nb_elevators int4 NULL,
        customer_city varchar NULL,
        creation_date date NULL,
        customer_id varchar NOT NULL,
        CONSTRAINT dim_customers_pk PRIMARY KEY (dim_customer_id))")

      connection.exec("CREATE TABLE public.fact_intervention (intervention_id serial NOT NULL,
        employee_id int4 NULL,
        building_id int4 NULL,
        battery_id varchar(255) NULL,
        column_id varchar(255) NULL,
        elevator_id varchar(255) NULL,
        intervention_start_date date NULL, 
        intervention_end_date date NULL,
        intervention_result varchar NULL,
        intervention_report varchar NULL,
        intervention_status varchar NULL,

        CONSTRAINT fact_intervention_pk PRIMARY KEY (intervention_id),
        CONSTRAINT building_id FOREIGN KEY (building_id) REFERENCES buildings(building_id) MATCH FULL
        )")

      
      ######################################### ^ CREATING TABLES ^ ####################################################
      ######################################### v FILLING  TABLES v ####################################################
      count = 1
      Building.all.each do |b|
        query1 = "INSERT INTO buildings (address,admin_name,admin_email,admin_phone,name_service_contact,email_service_contact,phone_service_contact,building_id) VALUES ('#{b.address_id}', '#{b.admin_name}', '#{b.admin_email}', '#{b.admin_phone}', '#{b.name_service_contact}', '#{b.email_service_contact}', '#{b.phone_service_contact}', '#{b.id}')"
        connection.exec(query1)
        puts "Inserted one record into buildings (#{count})"
        count +=1
      end

      count = 1
      Customer.all.each do |c|
        query2 = "INSERT INTO customers (creation_date, business_name, address, contact_name, contact_phone, email_contact, business_description, name_service_contact, phone_service_contact, email_service_contact) VALUES ('#{c.creation_date}', '#{c.business_name}', '#{c.address_id}', '#{c.contact_name}', '#{c.contact_phone}', '#{c.email_contact}', '#{c.business_description}', '#{c.name_service_contact}', '#{c.phone_service_contact}', '#{c.email_service_contact}')"
        connection.exec(query2)
        puts "Inserted one record into customers (#{count})"
        count +=1
      end

      count = 1
      Quote.all.each do |q|
        query3 = "INSERT INTO  fact_quotes (creation_date, company_name, email, nb_elevator) VALUES ('#{q.created_at}', '#{q.company_name}', '#{q.email}', '#{q.shafts_required}')"
        connection.exec(query3)
        puts "Inserted one record into fact_quotes (#{count})"
        count +=1
      end

      count = 1
      Elevator.all.each do |e|
        city = nil
        nbuilding_id = nil
        Customer.all.each do |c|
          if c.id == e.customer_id
            Address.all.each do |a|
              if a.id == c.address_id
                city = a.city
              end
            end
          end
          Building.all.each do |b|
            if b.customer_id == c.id
              nbuilding_id = b.id
            end
          end
        end
      query4 = "INSERT INTO fact_elevators (serial_number, building_id, customer_id, building_city, commissionning_date) VALUES ('#{e.serial_number}', '#{nbuilding_id}', '#{e.customer_id}', '#{city}', '#{e.commissionning}')"
      connection.exec(query4)
      puts "Inserted one record into fact_elevators (#{count})"
      count +=1
      end

      count = 1
      Lead.all.each do |l|
        query5 = "INSERT INTO fact_contacts (company_name, email, project_name, creation_date) VALUES ('#{l.company_name}', '#{l.email}', '#{l.project_name}', '#{l.creation_date}')"
        connection.exec(query5)
        puts "Inserted one record into fact_contact (#{count})"
        count +=1
      end
      
      count = 1
      Customer.all.each do |c|
        city = nil
        Address.all.each do |a|
          if a.id == c.address_id
            city = a.city
          end
        end
        elevCount = 0
        Elevator.all.each do |e|
          if e.customer_id == c.id
            elevCount += 1
          end
        end
        query6 = "INSERT INTO dim_customers (company_name, full_name_company_contact, email_company_contact, nb_elevators, customer_city, creation_date, customer_id) VALUES ('#{c.business_name}', '#{c.contact_name}', '#{c.email_contact}', '#{elevCount}', '#{city}', '#{c.creation_date}', '#{c.id}')"
        connection.exec(query6)
        puts "Inserted one record into dim_customers (#{count})"
        count +=1
      end
      
      count = 1
      Intervention.all.each do |i|

        if i.intervention_end_date?


          query7 = "INSERT INTO fact_intervention (intervention_id, employee_id, building_id, battery_id, column_id, elevator_id, intervention_start_date, 
          intervention_end_date, intervention_result, intervention_report, intervention_status) VALUES ('#{i.id}', '#{i.employee_id}', '#{i.building_id}', '#{i.battery_id}', '#{i.column_id}', '#{i.elevator_id}', '#{i.intervention_start_date}',
          '#{i.intervention_end_date}', '#{i.intervention_result}', '#{i.intervention_report}', '#{i.intervention_status}')"
          connection.exec(query7)
          count +=1
          else
            query8 = "INSERT INTO fact_intervention (intervention_id, employee_id, building_id, battery_id, column_id, elevator_id, intervention_start_date, 
           intervention_result, intervention_report, intervention_status) VALUES ('#{i.id}', '#{i.employee_id}', '#{i.building_id}', '#{i.battery_id}', '#{i.column_id}', '#{i.elevator_id}', '#{i.intervention_start_date}',
           '#{i.intervention_result}', '#{i.intervention_report}', '#{i.intervention_status}')"
          connection.exec(query8)
          count +=1

        end
      puts "Inserted one record into fact_intervention (#{count})"


      end
    end
  end
