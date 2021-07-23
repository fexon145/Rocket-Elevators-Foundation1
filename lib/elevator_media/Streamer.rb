# require 'rails_helper'
require 'elevator_media/Streamer'
require 'rest-client'


module ElevatorMedia 
    class Streamer

        def initialize
            @chuck_norris = 'http://api.icndb.com/jokes/random'

        end

        def getContent(type='chuck_norris')
            getHtmlFromCloud(type)
        end

        def getHtmlFromCloud(type)
            if type == 'chuck_norris'
              return "<div class='elevator-media-streamer-content'>#{JSON.parse(self.getChuckNorrisQuote)['value']['joke']}</div>"
            end 
        end

        def getChuckNorrisQuote
            @response = RestClient::Request.execute(method: :get, url: @chuck_norris, header: {})
        end

    end 
end
