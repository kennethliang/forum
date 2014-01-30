class Post < ActiveRecord::Base
  attr_accessible :content, :user_id, :topic_id, :view_count,:title
  belongs_to :topic  
  belongs_to :user    
end
