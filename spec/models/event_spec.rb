require 'rails_helper'

describe Event do
  describe 'validations' do
    it 'should have unique provider/id combination' do
      Event.create original_provider: 'foo', original_id: 123456789
      expect { Event.create! original_provider: 'foo', original_id: 123456789 }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'should alllow other meetup events' do
      Event.create original_provider: 'foo', original_id: 2344
      expect { Event.create! original_provider: 'foo', original_id: 2345 }.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
