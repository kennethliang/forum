class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:admin_flag,:nick_name, :first_name, :last_name, :password, :profile_pic1, :profile_pic2, :profile_pic3, :profile_pic4, :profile_pic5, :profile_pic6, :profile_pic7
  # attr_accessible :title, :body
end
