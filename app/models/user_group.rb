class UserGroup < ActiveRecord::Base
  has_many :quickies, :foreign_key => "user_group_id", :inverse_of => :user_group
end
