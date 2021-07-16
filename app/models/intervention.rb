class Intervention < ApplicationRecord
    after_create :ticket_create_quote
    require 'zendesk_api'


    validates :author_id, presence: true
    validates :customer_id, presence: true
    validates :building_id, presence: true
    validate :intervention_valid


    belongs_to :author, class_name: "Employee"
    belongs_to :customer, class_name: "Customer"
    belongs_to :building, class_name: "Building"
    belongs_to :battery, class_name: "Battery", optional: true
    belongs_to :column, class_name: "Column", optional: true
    belongs_to :elevator, class_name: "Elevator", optional: true
    belongs_to :employee, class_name: "Employee", optional: true


    def intervention_valid
        if !self.battery_id && !self.column_id && !self.elevator_id
            errors.add(:you, ' select one of them ')
        end
    end


    def ticket_create_quote
        client = ZendeskAPI::Client.new do |config|
            # Mandatory:
          
            config.url = "https://fexo.zendesk.com/api/v2" # e.g. https://rocketelevator8148.zendesk.com/api/v2
          
            # Basic / Token Authentication
            config.username = "dontbanfor1week@hotmail.com"
            
          
            # Choose one of the following depending on your authentication choice
            config.token = ENV["ZENDESK_APIKEY"]
          
          #   # OAuth Authentication
          #   config.access_token = "your OAuth access token"
          
            # Optional:
          
            # Retry uses middleware to notify the user
            # when hitting the rate limit, sleep automatically,
            # then retry the request.
            config.retry = true
          
            # Raise error when hitting the rate limit.
            # This is ignored and always set to false when `retry` is enabled.
            # Disabled by default.
            config.raise_error_when_rate_limited = false
          
            # Logger prints to STDERR by default, to e.g. print to stdout:
            require 'logger'
            config.logger = Logger.new(STDOUT)
          
            # Disable resource cache (this is enabled by default)
            config.use_resource_cache = false
          
            # Changes Faraday adapter
            # config.adapter = :patron
          
            # Merged with the default client options hash
            # config.client_options = {:ssl => {:verify => false}, :request => {:timeout => 30}}
          
            # When getting the error 'hostname does not match the server certificate'
            # use the API at https://yoursubdomain.zendesk.com/api/v2
        end
        # ticket = ZendeskAPI::Ticket.new("#{client}", :id => 1, :priority => "urgent")
        lastnameauthor = Employee.find("#{author_id}").last_name
        firstnameauthor = Employee.find("#{author_id}").first_name
        customer = Customer.find("#{customer_id}")
        lastnameemp = Employee.find("#{employee_id}").last_name
        firstnameemp = Employee.find("#{employee_id}").first_name
        

        puts "This is the client after creation #{client}"
        client.tickets.create(
            :subject => "Rocket Elevator Intervention", 
            :comment => { :value => "The intervention your request was send:
            The Requester: #{lastnameauthor} #{firstnameauthor}
            The Customer: #{customer.compagny_name}
            The Building ID: #{building_id}
            The Battery ID: #{battery_id}
            The Column ID: #{column_id}
            The Elevator ID: #{employee_id}
            The Employee assign to this is: #{lastnameemp} #{firstnameemp}
            The Description: #{report}" },
            :submitter_id => client.current_user.id, 
            :type => "Intervention Needed",
            :priority => "as fast as we can")
        puts "Ticket creation?"
        client.tickets.save
        puts "Ticket saved?"
    end
end
