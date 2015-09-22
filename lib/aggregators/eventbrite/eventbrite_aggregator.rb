require 'rest-client'

class EventbriteAggregator
=begin
	include HTTParty
	base_uri "https://www.eventbriteapi.com/v3/"

  def initialize
    @options = { 
    	#:token 						=> Rails.application.secrets.eventbrite_token, 
    	:"location.latitude"		=> 53.2167, 
    	:"location.longitude"		=> 6.5667, 
    	:"start_date.range_start"	=> DateTime.now.to_s,
    	headers:{
    		#{}"Accept" =>  "application/json"
    		"Authorization"				=>  "Bearer #{Rails.application.secrets.eventbrite_token}"
    	}
    }
    puts @options
  end

  def fetch
  	raw_result = self.class.get("events/search/", @options)
  	result = JSON.parse(raw_result)
  end
=end
	def fetch
		params = {
	    	:"location.latitude"		=> 53.2167, 
	    	:"location.longitude"		=> 6.5667, 
	    	:"start_date.range_start"	=> DateTime.now.to_s
	    }

		RestClient.get "https://www.eventbriteapi.com/v3/events/search/", {params: params, accept: :json,  authorization: "Bearer #{Rails.application.secrets.eventbrite_token}"}
	end

end