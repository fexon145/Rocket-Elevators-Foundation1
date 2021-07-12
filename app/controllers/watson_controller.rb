class WatsonController < ApplicationController
    require "ibm_watson/authenticators"
    require "ibm_watson/text_to_speech_v1"
        
    def greetings    
        puts"ENTERED THE CONTROLLER"
        # If using IAM
        authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
        apikey: ENV["WATSON_APIKEY"]
        )

        text_to_speech = IBMWatson::TextToSpeechV1.new(
        authenticator: authenticator
        )
        text_to_speech.service_url = "https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/4bc146b9-c01b-41a1-9ffa-d3774c21a6fb"
        elevator_inactive = Elevator.where.not(status: 'Active').count.to_s
        diff_city = Address.select('distinct(city)').count
        user_greeting = "Hello #{current_user.employee.first_name}. There are currently #{Elevator.count} elevators deployed in the #{Building.count} buildings of your #{Customer.count} customers. Currently, #{elevator_inactive} elevators are not in Running Status and are being serviced. You currently have #{Quote.count} quotes awaiting processing. You currently have #{Lead.count} leads in your contact requests. #{Battery.count} Batteries are deployed across #{diff_city} cities."

        File.open("app/assets/audio/welcome.wav", "wb") do |audio_file|
            response = text_to_speech.synthesize(
                text: "#{user_greeting}",
                accept: "audio/wav",
                voice: "en-US_AllisonVoice"
            )
            audio_file.write(response.result)
            puts"END OF THE AUDIO"
        end
    end
end