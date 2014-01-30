class CreateUserPostVotes < ActiveRecord::Migration
  def change
    create_table :user_post_votes do |t|
      t.integer :user_id
      t.boolean :agree

      t.timestamps
    end
  end
end
