class UserPostVote < ActiveRecord::Base
  attr_accessible :agree, :user_id, :post_id
  belongs_to :user 
  belongs_to :post 
  
  
  def self.total_count(vote_id,post_id)
    case vote_id
    when 0
      return UserPostVote.where(:agree => true, :post_id => post_id).count
    when 1
      return UserPostVote.where(:agree => false, :post_id => post_id).count
    when 2
      return UserPostVote.where("agree is null and post_id = #{post_id}").count
    end    
  end
  def self.check_if_user_voted(user_id,post_id)
  return UserPostVote.where(:user_id => user_id, :post_id => post_id).first  ? true:false
  end
  
  def self.user_vote(user_id, post_id,agree_value)   

    user_post_vote = nil;
    user_post_vote = UserPostVote.where(:user_id => user_id, :post_id => post_id).first 
    if (user_post_vote)
      #if exist then update
      user_post_vote.update_attributes(:post_id => post_id, :user_id => user_id, :agree => agree_value)
    else
     # if doesn't exist then create
    user_post_view = UserPostVote.new();
    user_post_view.post_id = post_id;
    user_post_view.user_id = user_id;
    user_post_view.agree = agree_value;
    user_post_view.save();
    end
  end
  
  

end
