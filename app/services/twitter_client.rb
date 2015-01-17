class TwitterClient

  attr_accessor :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.secrets.twitter_consumer_key
      config.consumer_secret = Rails.application.secrets.twitter_consumer_secret
    end
  end

  def recent_tweets(nb)
    @client.search("#UGQuickie", { count: nb, result_type: "recent" })
  end
end
