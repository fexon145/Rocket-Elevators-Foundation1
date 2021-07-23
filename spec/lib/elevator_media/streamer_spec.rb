require 'rails_helper'
require 'spec_helper'
require 'elevator_media/Streamer'
require 'rest-client'

describe ElevatorMedia::Streamer do
    let!(:streamer){ElevatorMedia::Streamer.new}

    # first basic test response
    it "a first test to initialize environment" do
        expect(true).to be true
    end

    it "should receive a response from getContent" do
        expect(streamer).to respond_to(:getContent)        
    end

    describe "getContent behavior" do
        # Testing the gethtml method returns "interesting"
        it "should get interesting html content from internet" do
            expect(streamer).to receive(:getHtmlFromCloud)
            streamer.getContent()
        end

        # Testing if the getContent returns 'chuck_norris'
        it "default content should be of 'chuck_norris' type" do
            expect(streamer).to receive(:getChuckNorrisQuote).and_return({value: {joke: 'Chuck Norris joke received'}}.to_json) 
            streamer.getContent('chuck_norris')
        end

        # Testing Chuck Norris database returns a quote
        it 'got response from Chuck Norris database' do
            json_response = JSON.parse(streamer.getChuckNorrisQuote)
            p json_response
            expect(json_response["type"]).to eq("success")
        end
    
    end
end