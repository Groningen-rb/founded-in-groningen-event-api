class Event < ActiveRecord::Base
  MEETUP = 'meetup'
  EVENTBRITE = 'eventbrite'

  PROVIDERS = [MEETUP, EVENTBRITE]

  validates :name, presence: true
  validates :original_provider, inclusion: { in: PROVIDERS }
  validates :original_id, presence: true
  validates :description, presence: true
  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
  validates :location, presence: true
end
