module Aggregators
  class Base
    include Celluloid

    def fetch
      fail 'implement me'
    end
  end
end