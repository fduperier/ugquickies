class VoteByTweet < ActiveRecord::Base
  acts_as_voter

  belongs_to :quickie, :class_name => "Quickie", :foreign_key => "quickie_id", :inverse_of => :vote_by_tweets

  validate :quickie, :presence => true
  validate :tweet_id, :presence => true
end
