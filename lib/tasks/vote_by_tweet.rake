namespace :vote_by_tweet do
  desc "Updating vote by tweet"

  task update: :environment do
    service = VoteByTweetService.new
    service.parse_new_vote
  end

end
