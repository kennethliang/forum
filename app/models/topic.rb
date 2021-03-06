class Topic < ActiveRecord::Base
  attr_accessible :last_post, :last_poster_id, :forum_id,:title,:body,:user_id
  has_many :posts, :dependent => :destroy
  belongs_to :forum
  belongs_to :user
end
