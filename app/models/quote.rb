class Quote < ApplicationRecord
    # after_create :ticket_create_quote
    # require 'zendesk_api'

    # def ticket_create_quote
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
    #     client.tickets.create(:subject => "#{company_name} at #{email}", 
    #         :comment => { :value => "The company #{company_name} which can be reached at email #{email} sent us a quote requesting Rocket Elevators services. Here's the key elements of the quote we received:
    #         Building type: #{name}
    #         Product Line Quality: #{product_line}
    #         Number of Apartments: #{number_of_appartement}
    #         Number of Floors: #{number_of_floor}
    #         Number of Basements: #{number_of_basement}
    #         Number of Companies: #{number_of_companies}
    #         Number of Parking Spots: #{number_of_parking_spots}
    #         Number of Corporations: #{number_of_corporations}
    #         Maximum Occupancy: #{maximum_occupancy}
    #         Total Business Hours/Day: #{business_hours}
    #         Amount of Elevator needed: #{number_of_elevators}
    #         Unit Price per Elevator: #{unit_price_of_each_elevator}
    #         Total Price of All Elevators: #{total_price_of_elevators}
    #         Installation fees: #{installation_fees}
    #         Total Price: #{final_price}" }, 
    #         :submitter_id => client.current_user.id, 
    #         :type => "task",
    #         :priority => "normal")
    #     puts "Ticket creation?"
    #     client.tickets.save
    #     puts "Ticket saved?"
    # end
end
