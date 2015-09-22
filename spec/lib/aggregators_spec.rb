require 'spec_helper'

describe Aggregators do
  describe 'all_aggregators' do
    it 'does not include the base aggregator' do
      expect(Aggregators.all_aggregators).to_not include Aggregators::Base
    end

    it 'includes all the aggregators' do
      expect(Aggregators.all_aggregators).to include Aggregators::Test
    end
  end
end
