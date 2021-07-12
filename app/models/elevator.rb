class Elevator < ApplicationRecord
    belongs_to  :column, class_name: "Column", optional: true
    before_update :old_status

    def old_status
        $old_status = self.status_was
    end

    # after_update :slack1
    # def slack1
    #     notifier = Slack::Notifier.new (ENV["SLACK_APIKEY1"])
    #     if self.saved_change_to_status? then
    #         notifier.ping "Elevator ID #{self.id} with Serial Number #{self.serial_number} changed status from #{$old_status} to #{self.status}"
    #     end
    # end

    after_update :slack
    def slack
        notifier = Slack::Notifier.new (ENV["SLACK_APIKEY"])
        if self.saved_change_to_status? then            
            notifier.ping "Elevator ID #{self.id} with Serial Number #{self.serial_number} changed status from #{$old_status} to #{self.status}"
        end
    end

    # To set up environmental variables, see http://twil.io/secure
    after_update :Twilio
    def Twilio
        account_sid = ENV['TWILIO_ACCOUNT_SID']
        auth_token = ENV['TWILIO_AUTH_TOKEN']
        client = Twilio::REST::Client.new(account_sid, auth_token)

        from = '+12512921451' #  Twilio number
        to = '+15145037764' #  mobile phone number

        # if self.saved_change_to_status? then    
        if self.saved_change_to_status? && status == "Intervention" then                  
            client.messages.create(
            from: from,
            to: to,
            body: "Elevator ID #{self.id} with Serial Number #{self.serial_number} status changed from #{$old_status} to #{self.status}"
            )
        end
    end
end