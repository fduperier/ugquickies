class Quickie < ActiveRecord::Base
  acts_as_votable

  belongs_to :user_group, :class_name => "UserGroup", :foreign_key => "user_group_id", :inverse_of => :quickies
  belongs_to :creator, :class_name => "User", :foreign_key => "creator_id", :inverse_of => :quickies

  validate :title, :presence => true
  validate :description, :presence => true
  validate :date, :presence => true
end
