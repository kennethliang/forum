class AddPostIdToUserPostVotesTable < ActiveRecord::Migration
  def change
    add_column :user_post_votes, :post_id, :integer
  end
end
