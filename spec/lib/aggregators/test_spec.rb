require 'spec_helper'

describe Aggregators::Test do
  it 'fetch can run as a future' do
    future = Aggregators::Test.new.future.fetch
    expect(future.value).to eq []
  end
end
