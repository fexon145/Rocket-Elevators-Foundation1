require 'pg'
con = PG::Connection.open(host: 'codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com', port: 5432, user: 'codeboxx', dbname:'AlexandreLanglois', password:'Codeboxx1!')
#con = PG::Connection.open(host: '127.0.0.1', port: 5432, user: 'codeboxx', dbname:'AlexandreLanglois', password:'Codeboxx1')
namespace :app do
  desc "Create the FactElevator Table"
  task factelevator: :environment do

    con.exec('DROP TABLE IF EXISTS FactElevator')
    con.exec('CREATE TABLE FactElevator(
      serialNumber INT,
      date_of_commissioning INT,
      buildingID INT,
      customerID INT,
      building_city VARCHAR) ;')
    end

  task feseed: :environment do
    con.exec("TRUNCATE TABLE FactElevator RESTART IDENTITY;")
    Elevator.all.each do |e|
    con.exec("INSERT INTO FactElevator (serialNumber, date_of_commissioning, buildingID, customerID, building_city) VALUES (#{e.serial_number}, #{e.date_of_commissioning}, #{e.column.battery.building.id}, #{e.column.battery.building.customer.id}, '#{e.column.battery.building.address_of_the_building.city}');")
    end
  end
  desc "Create the DimCustomers Table"
  task dimcustomers: :environment do

    con.exec('DROP TABLE IF EXISTS DimCustomers')
    con.exec('CREATE TABLE DimCustomers(
      creation_date DATE,
      company_name VARCHAR,
      full_name_of_the_company_main_contact VARCHAR,
      email_of_the_company_main_contact VARCHAR,
      nbElevators INT,
      customers_city VARCHAR) ;')
  end
  task dimseed: :environment do
    con.exec("TRUNCATE TABLE DimCustomers RESTART IDENTITY;")
    Customer.all.each do |c|
      numElevators = 0
      puts "nb of building #{c.buildings}"
      c.buildings.all.each do |bld|
        puts "nb of battery #{bld.batteries}"
        bld.batteries.all.each do |bat|
          puts "nb of column #{bat.columns.length()}"
          bat.columns.all.each do |col|
            puts "nb of elevator #{col.elevators.length()}"
            
            numElevators = numElevators + col.elevators.count()
            puts "#{numElevators}"
          end
        end
      end      
    con.exec("INSERT INTO DimCustomers (creation_date, company_name, full_name_of_the_company_main_contact, email_of_the_company_main_contact, nbElevators, customers_city)
    VALUES ('#{c.customers_creation_date}', '#{c.compagny_name}', '#{c.full_name_of_the_company_contact}', '#{c.email_of_the_company_contact}', #{numElevators}, '#{c.company_headquarters_address.city}');")
    end
  end
  task quotetable: :environment do
    # con = PG::Connection.open(host: '127.0.0.1', port: 5432, user: 'postgres', dbname: 'fexon', password: 'mynewpassword')
    con.exec('DROP TABLE IF EXISTS factquote')
    con.exec('CREATE TABLE factquote(
    quote_id INT PRIMARY KEY, 
    creation DATE,
    company_name TEXT,   
    email TEXT,
    nbelevator INT) ;')
  end
 
    desc "data transfer"
  
    task quoteseed: :environment do
      con.exec("TRUNCATE TABLE factquote RESTART IDENTITY;")
      Quote.all.each do |q|
        con.exec("INSERT INTO factquote (quote_id, creation, company_name, email, nbelevator) VALUES (#{q.id}, '#{q.created_at}', '#{q.company_name}', '#{q.email}', #{q.number_of_elevators})")
    end
  end
  task factcontact: :environment do
    # conn = PG::Connection.open(user: 'swtangel88', dbname: 'swtangel88')
    con.exec('DROP TABLE IF EXISTS factcontact')
    con.exec("CREATE TABLE factcontact(
      contactId INT,
      creationDate DATE,
      companyName TEXT, 
      email TEXT,
      projectName TEXT
      );")
  end

  desc "Seed Factcontact Table"
  task factcontact1: :environment do
    con.exec("TRUNCATE TABLE factcontact RESTART IDENTITY;")
    Lead.all.each do |l|
    con.exec("INSERT INTO factcontact (contactId, creationDate, companyName, email, projectName) VALUES (#{l.id}, '#{l.created_at}', '#{l.company_name}', '#{l.email}', '#{l.project_name}');")
    end
  end
end

