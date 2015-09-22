require 'rest-client'
require "json"

class EventbriteAggregator

	def fetch_page(page_number=1)
		params = {
	    	"location.latitude"		=> 53.2167, 
	    	"location.longitude"	=> 6.5667, 
	    	:page 					=> page_number
	    }

		raw_response =RestClient.get "https://www.eventbriteapi.com/v3/events/search/", {params: params, accept: :json,  authorization: "Bearer #{Rails.application.secrets.eventbrite_token}"}
		response = JSON.parse(raw_response, symbolize_names: true);

	end

	def fetch

		first_page = fetch_page
		puts first_page
		page_count = first_page[:pagination][:object_count] / first_page[:pagination][:page_size]
		puts page_count
		return first_page[:events].map {|json| build_event_from_json(json) } if page_count.zero?

		results = first_page[:events]

		page_count.times do |page_number|
			results << fetch_page(page_number)[:events]
		end

		return results.map {|json| build_event_from_json(json) }
	end

	def build_event_from_json(json)
		Event.new(
			original_provider: Event::EVENTBRITE,
			original_id: json[:id],
			name: json[:name],
			description: json[:description][:text],
			start_datetime: json[:start][:utc],
			end_datetime: json[:end][:utc],
			location: "YOLO"
		)
	end

end