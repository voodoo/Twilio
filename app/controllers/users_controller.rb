class UsersController < ApplicationController
  
  def new
    @user = User.new(:state => 'Texas')
  end
  
  def show
    @user = User.find(params[:id])
    if current_user != @user
      flash[:error] = "Unauthorized"
      redirect_to login_path
      return
    end
  end
  def update
    if current_user.update_attributes(params[:user])
      redirect_to user_path(current_user)
    else
      @user = current_user
      render :action => :edit
    end
  end
  def edit
    @user = current_user
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end
