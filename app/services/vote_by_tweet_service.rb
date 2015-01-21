class VoteByTweetService
  @@metadata_keys = [ :max_id, :since_id, :count, :completed_in ]

  def parse_new_vote
    results = retrieve_tweets
    save_new_search results.attrs[:search_metadata]

    # Parse results to get votes for quickie
    results.each do |tweet|
      handle_tweet tweet
    end
  end
  
  def handle_tweet(tweet)
    logger.debug "Receiving tweet data : #{tweet.attrs}"
    quickie = find_quickie_from tweet
    vote_for(quickie, tweet) if quickie
  end

  private
    def retrieve_tweets
      twitter_client = Twitter::MyClient.new

      # Load last handled tweet_id
      begin
        start_id = TweetSearch.first!.since_id
      rescue ActiveRecord::RecordNotFound
        start_id = nil
      end
      logger.debug "Retrieving tweets from id : #{start_id}"
      twitter_client.recent_votes start_id
    end

    def save_new_search(search_metadata)
      new_search = TweetSearch.new(search_metadata.slice(*@@metadata_keys))
      new_search.save
    end

    def find_quickie_from(tweet)
      hashtags = get_hashtags_from tweet
      found = false
      quickie = nil
      hashtag = hashtags.shift
      until (hashtag.nil? or found) do
        quickie = Quickie.find_by_hashtag(hashtag)
        hashtag = hashtags.shift
        found = true if quickie
      end
      quickie
    end

    def get_hashtags_from(tweet)
      hashtags = tweet.hashtags.map { |hashtag| hashtag.text }
      hashtags.select! { |hashtag| hashtag != 'UGQuickie' and hashtag != 'Vote' }
    end

    def vote_for(quickie, tweet)
      if VoteByTweet.find_by(quickie_id: quickie.id, tweet_screen_name: tweet.user.screen_name)
        logger.info "Twitter user @#{tweet.user.screen_name} has already voted for quickie #{quickie.id}"
      else
        vote_by_tweet = VoteByTweet.new
        vote_by_tweet.quickie_id = quickie.id
        vote_by_tweet.tweet_screen_name = tweet.user.screen_name
        vote_by_tweet.tweet_id = tweet.id
        vote_by_tweet.save

        logger.debug "VoteByTweet created : #{vote_by_tweet.id}"

        quickie.liked_by vote_by_tweet
      end
    end
end