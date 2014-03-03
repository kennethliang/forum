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
    #raise params[:user].inspect;
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: "new", error: 'User was not successfully created.'
    end
   
  end
    
end