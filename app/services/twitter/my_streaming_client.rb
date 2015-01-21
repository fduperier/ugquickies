module Twitter
  class MyStreamingClient

    def initialize
      @streaming_client = Twitter::Streaming::Client.new do |config|
        config.consumer_key        = Rails.application.secrets.twitter_consumer_key
        config.consumer_secret     = Rails.application.secrets.twitter_consumer_secret
        config.access_token        = Rails.application.secrets.twitter_access_token
        config.access_token_secret = Rails.application.secrets.twitter_access_token_secret
      end

      @vote_by_tweet_service = VoteByTweetService.new
    end

    def stream_tweets
      @streaming_client.filter(track: "#UGQuickie #Vote") do |object|
        if object.is_a?(Twitter::Tweet)
          # puts object.attrs
          @vote_by_tweet_service.handle_tweet object
        end
      end
    end

  end
end
