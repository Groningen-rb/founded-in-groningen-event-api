Celluloid.shutdown_timeout = 1

Dir[File.dirname(__FILE__) + '/aggregators/*.rb'].each {|file| require file }
module Aggregators

  def self.all_aggregators
    Aggregators.constants.select {|c| c != :Base && Class === Aggregators.const_get(c)}
                         .map { |c| Aggregators.const_get(c) }
  end
end
