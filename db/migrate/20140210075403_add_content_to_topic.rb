class AddContentToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :body, :text
    rename_column :topics, :name, :title
    remove_column :posts, :title
  end
end
