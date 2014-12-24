class Quickie < ActiveRecord::Base
  acts_as_votable
  acts_as_commontable

  belongs_to :user_group, :class_name => "UserGroup", :foreign_key => "user_group_id", :inverse_of => :quickies
  belongs_to :creator, :class_name => "User", :foreign_key => "creator_id", :inverse_of => :quickies

  scope :by_user_group, ->(user_group_id) { where(user_group_id: user_group_id) }

  scope :past, -> { where('date < ?', DateTime.now) }
  scope :past_ordered, -> { past.order(date: :desc) }
  scope :top_past, -> { past.order(cached_votes_total: :desc).limit(3) }
  
  scope :future, -> { where('date >= ?', DateTime.now) }
  scope :future_ordered, -> { future.order(date: :asc) }
  scope :top_future, -> { future.order(cached_votes_total: :desc).limit(3) }

  validate :title, :presence => true
  validate :description, :presence => true
  validate :date, :presence => true
  
  def self.policy_class
    QuickiePolicy
  end
end
