class EventbriteAggregator
	include HTTParty
	base_uri "https://www.eventbriteapi.com/v3/events/search/"

  def initialize(service, page)
    @options = { token: Rails.application.secrets.eventbrite_token }
  end
end