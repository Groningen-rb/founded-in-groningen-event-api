require 'rails_helper'

describe EventsController do
  def meetup
    Event.create(
      original_provider: 'meetup',
      original_id: SecureRandom.uuid,
      name: 'Groningen.rb',
      description: 'Leukste meetup evaarrrrrrr!',
      start_datetime: Time.zone.now,
      end_datetime: 3.hours.from_now,
      location: 'Launchcafé',
      rsvp_link: 'https://groningen-rb.org/2015'
    )
  end

  def eventbrite
    Event.create(
      original_provider: 'eventbrite',
      original_id: SecureRandom.uuid,
      name: 'PyGrunn',
      description: 'Ook leuk...',
      start_datetime: Time.zone.now.at_beginning_of_year,
      end_datetime: Time.zone.now.at_beginning_of_year + 24.hours,
      location: 'Forum Images',
      rsvp_link: 'https://pygrunn.org/2015'
    )
  end

  describe '#index' do
    let(:meetup1) { meetup }
    let(:meetup2) { meetup }

    let(:eventbrite1) { eventbrite }
    let(:eventbrite2) { eventbrite }

    let(:meetups) { [meetup1, meetup2] }
    let(:eventbrites) { [eventbrite1, eventbrite2] }

    it 'returns an array of events from different sources' do
      expect(assigns(:events)).to eq [meetup1, meetup2, eventbrite1, eventbrite2]
    end
  end
end
