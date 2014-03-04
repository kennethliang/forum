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
  
  
  def show
    @user = User.find(params[:id])
  end  
  
  
  def edit
    @user = User.find(params[:id])
  end
  
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: "edit" 
    end
  end

  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: "new", error: 'User was not successfully created.'
    end
   
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy    
    redirect_to users_url 
  end    
end