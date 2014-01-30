class AddFieldsToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :nick_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :profile_pic1, :string
    add_column :users, :profile_pic2, :string
    add_column :users, :profile_pic3, :string
    add_column :users, :profile_pic4, :string  
    add_column :users, :profile_pic5, :string
    add_column :users, :profile_pic6, :string
    add_column :users, :profile_pic7, :string       
  end
end
