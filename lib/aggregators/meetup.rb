module Aggregators
  class Meetup < Base
    def fetch
      params = {
          city: 'Groningen',
          country: 'NL',
          status: 'upcoming',
          format: 'json',
          radius: 5,
          page: '50'}
      meetup_api = MeetupApi.new
      events = meetup_api.open_events(params)
      convert events['results']
    end

    def convert(meetup_events)
      events = []
      meetup_events.each do |meetup_event|
        event = Event.new
        event.name = meetup_event['name']
        event.description = meetup_event['description']
        event.original_provider = 'meetup'
        event.original_id = meetup_event['id']
        event.start_datetime = Time.at(meetup_event['time']).to_datetime
        event.location = meetup_event['venue']
        event.rsvp_link = meetup_event['event_url']
        events << event
        # t.datetime "end_datetime"
      end
      events
    end
  end
end