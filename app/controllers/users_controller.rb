class UsersController < ApplicationController

  def index
    if user_signed_in?
      if (current_user.admin_flag == true)
        @users = User.all
      end
    end
  end
   
  def new
     @user = User.new
  end


  def create
    1/0
    raise parmas[:user].inspect;
    
    @user = User.new(params[:user])
  end
    
end