class Topic < ActiveRecord::Base
  attr_accessible :last_post, :last_poster_id, :name, :forum_id
  has_many :posts, :dependent => :destroy
  belongs_to :forum
end
