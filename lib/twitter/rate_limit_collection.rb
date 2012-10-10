require 'twitter/base'
require 'twitter/rate_limit'

module Twitter
  class RateLimitCollection < Twitter::Base

    # @return [Twitter::RateLimitCollection]
    def initialize(attrs={})
      attrs[:resources].keys.each do |key|
        val = attrs[:resources][key.to_sym].values[0]
        lim = Twitter::RateLimit.new(val)
        (class << self ; self ; end).send :attr_accessor , key
        send "#{key}=".to_sym, lim
      end
      
    end
    
  end
end
