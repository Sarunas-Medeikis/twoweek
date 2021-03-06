class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :destroy, :update]

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
     
    if @user.save
      redirect_to users_path, :notice =>  " User was succesfully created "
    else
      render 'new'  
    end
  end


  def new
    @user = User.new
  end

  def show
    
  end

  def edit
 
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, :notice => "User was succesfully  updated"
    else
    render 'edit'
    end 
  end

  def destroy
    @user.destroy
    redirect_to users_path, :notice =>  "User was succesfully deleted :C"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
