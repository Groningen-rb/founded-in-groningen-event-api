class EventsController < ApplicationController
  def index
    @events = events.flatten.map do |event|
      Event.find_or_create_by original_provider: event.original_provider,
                              original_id: event.original_id
    end.compact
  end

  def futures
    Aggregators.all_aggregators.map do |aggregator|
      aggregator.new.future.fetch
    end
  end

  def events
    futures.map(&:value)
  end
end
