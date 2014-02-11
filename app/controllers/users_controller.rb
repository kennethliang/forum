class UsersController < ApplicationController

  def index
    if user_signed_in?
      if (current_user.admin_flag == true)
        @users = User.all
      end
    end
  end
   
end