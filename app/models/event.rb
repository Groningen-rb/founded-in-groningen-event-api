class Event < ActiveRecord::Base
  MEETUP = 'meetup'
  EVENTBRITE = 'eventbrite'

  PROVIDERS = [MEETUP, EVENTBRITE]

  validates :name, presence: true
  validates :original_provider, inclusion: { in: PROVIDERS }, uniqueness: {scope: :original_id}
  validates :original_id, presence: true
  validates :start_datetime, presence: true
end
