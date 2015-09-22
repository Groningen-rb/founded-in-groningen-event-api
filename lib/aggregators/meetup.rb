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
    end
  end
end