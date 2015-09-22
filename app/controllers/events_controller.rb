class EventsController < ApplicationController
  def index
    futures = Aggregators.all_aggregators.map do |aggregator|
      aggregator.new.future.fetch
    end

    @events = futures.map(&:value).flatten
  end
end
