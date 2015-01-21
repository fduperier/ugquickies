# This is used to launch twitter streaming client
Rails.application.config.after_initialize do

  # Launch a new thread to stream tweets
  Thread.new do
    streaming_client = Twitter::MyStreamingClient.new
    streaming_client.stream_tweets
  end

end