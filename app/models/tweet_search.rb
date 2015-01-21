class TweetSearch < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  validate :max_id, :presence => true
  validate :since_id, :presence => true
  validate :count, :presence => true
  validate :completed_in, :presence => true
end
