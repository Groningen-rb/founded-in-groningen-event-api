class EventsController < ApplicationController
  def index
    futures = Aggregators.all_aggregators.map do |aggregator|
      aggregator.new.future.fetch
    end

    @events = futures.map(&:value).flatten.map do |event|
      Event.find_or_create_by original_provider: event.original_provider,
                              original_id: event.original_id
    end.compact
  end
end
