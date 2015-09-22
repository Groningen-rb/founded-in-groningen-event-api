require 'rest-client'
require "json"

class EventbriteAggregator

	def fetch
		params = {
	    	"location.latitude"		=> 53.2167, 
	    	"location.longitude"		=> 6.5667, 
	    }

		raw_response =RestClient.get "https://www.eventbriteapi.com/v3/events/search/", {params: params, accept: :json,  authorization: "Bearer #{Rails.application.secrets.eventbrite_token}"}
		response = JSON.parse(raw_response);

		
	end

end