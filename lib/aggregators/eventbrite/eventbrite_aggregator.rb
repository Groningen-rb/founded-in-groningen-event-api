class EventbriteAggregator
	include HTTParty
	base_uri "https://www.eventbriteapi.com/v3/"

  def initialize(service, page)
    @options = { 
    	:token 						=> Rails.application.secrets.eventbrite_token, 
    	:"location.latitude"		=> 53.2167, 
    	:"location.longitude"		=> 6.5667, 
    	:"start_date.range_start"	=> DateTime.now.to_s
    }
  end

  def fetch
  	self.class.get("events/search/", @options)
  end
end