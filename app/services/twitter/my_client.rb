module Twitter
  class MyClient

    def initialize
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key    = Rails.application.secrets.twitter_consumer_key
        config.consumer_secret = Rails.application.secrets.twitter_consumer_secret
      end
    end

    def recent_tweets(nb)
      @client.search("#UGQuickie", { count: nb, result_type: "recent" })
    end

    def recent_votes(start_id)
      options = { result_type: "recent" }
      options[:since_id] = start_id unless start_id.nil?

      @client.search("#UGQuickie #Vote", options)
    end
  end
end
