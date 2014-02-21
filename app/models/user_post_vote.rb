class UserPostVote < ActiveRecord::Base
  attr_accessible :agree, :user_id, :post_id
  belongs_to :user 
  belongs_to :post 
  
  def self.user_vote(user_id, post_id,vote_id)    
    user_post_vote = nil;
    user_post_vote = UserPostVote.where(:user_id => user_id, :post_id => post_id).first 
    if (user_post_vote)
      #if exist then update
      user_post_vote.update_attributes(:post_id => post_id, :user_id => user_id, :agree => true)
    else
     # if doesn't exist then create
    user_post_view = UserPostVote.new();
    user_post_view.post_id = post_id;
    user_post_view.user_id = user_id;
    user_post_view.agree = true;
    user_post_view.save();
    end
  end
  
  

end
