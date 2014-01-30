class UserPostVote < ActiveRecord::Base
  attr_accessible :agree, :user_id, :post_id
  belongs_to :user 
  belongs_to :post 
end
