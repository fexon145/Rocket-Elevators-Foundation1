class Lead < ApplicationRecord
    has_one_attached :file
    # after_create :ticket_create_contact
    # require 'zendesk_api'

    # def ticket_create_contact
    #     client = ZendeskAPI::Client.new do |config|
    #         # Mandatory:
          
    #         config.url = "https://rocketelevator8148.zendesk.com/api/v2" # e.g. https://rocketelevator8148.zendesk.com/api/v2
          
    #         # Basic / Token Authentication
    #         config.username = "rocketelevator@hotmail.com"
            
          
    #         # Choose one of the following depending on your authentication choice
    #         config.token = ENV["ZENDESK_APIKEY"]
          
    #       #   # OAuth Authentication
    #       #   config.access_token = "your OAuth access token"
          
    #         # Optional:
          
    #         # Retry uses middleware to notify the user
    #         # when hitting the rate limit, sleep automatically,
    #         # then retry the request.
    #         config.retry = true
          
    #         # Raise error when hitting the rate limit.
    #         # This is ignored and always set to false when `retry` is enabled.
    #         # Disabled by default.
    #         config.raise_error_when_rate_limited = false
          
    #         # Logger prints to STDERR by default, to e.g. print to stdout:
    #         require 'logger'
    #         config.logger = Logger.new(STDOUT)
          
    #         # Disable resource cache (this is enabled by default)
    #         config.use_resource_cache = false
          
    #         # Changes Faraday adapter
    #         # config.adapter = :patron
          
    #         # Merged with the default client options hash
    #         # config.client_options = {:ssl => {:verify => false}, :request => {:timeout => 30}}
          
    #         # When getting the error 'hostname does not match the server certificate'
    #         # use the API at https://yoursubdomain.zendesk.com/api/v2
    #     end
    #     # ticket = ZendeskAPI::Ticket.new("#{client}", :id => 1, :priority => "urgent")
    #     puts "This is the client after creation #{client}"
    #     client.tickets.create(
    #         :subject => "#{full_name} from #{company_name}", 
    #         :comment => { :value => "The contact #{full_name} from company #{company_name} can be reached at email #{email} and at phone number #{phone_number}. #{departement} has a project named #{project_name} which would require contribution from Rocket Elevators.
    #         #{project_description}
    #         Attached Message: #{message}
    #         The Contact uploaded an attachment" }, 
    #         :submitter_id => client.current_user.id,
    #         :type => "question", 
    #         :priority => "normal")
    #     puts "Ticket creation?"
    #     client.tickets.save
    #     puts "Ticket saved?"
    # end
end
