require 'rails_helper'
require "#{Rails.root.join('lib')}/aggregators/meetup_aggregator"



describe MeetupAggregator do
  describe '#list' do
    it 'should return meetup event in Grun' do
      expect(described_class.new.fetch).to have_key('results')
    end

  end
end