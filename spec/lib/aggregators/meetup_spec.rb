require 'rails_helper'

describe Aggregators::Meetup do
  describe '#list' do
    it 'should return meetup event in Grun' do
      expect(described_class.new.fetch).to have_key('results')
    end
  end
end