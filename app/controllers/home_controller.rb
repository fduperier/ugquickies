class HomeController < ApplicationController
  before_filter :load_twitter_client

  def index
    @user_groups = UserGroup.all

    if params[:user_group]
      user_group_id = params[:user_group]
      @past_quickies = Quickie.by_user_group(user_group_id).past_ordered
      @future_quickies = Quickie.by_user_group(user_group_id).future_ordered

      @past_top3 = Quickie.by_user_group(user_group_id).top_past
      @future_top3 = Quickie.by_user_group(user_group_id).top_future
    else
      @past_quickies = Quickie.past_ordered
      @future_quickies = Quickie.future_ordered

      @past_top3 = Quickie.top_past
      @future_top3 = Quickie.top_future
    end

    begin
      @recent_tweets = @twitter_client.recent_tweets(10)
    rescue Twitter::Error::TooManyRequests
      logger.error "Twitter::Error::TooManyRequests - Rate limit exceeded"
      @recent_tweets_error = t('home.tweets.error')
    end
  end

  private
    def load_twitter_client
      @twitter_client = TwitterClient.new
    end
end
