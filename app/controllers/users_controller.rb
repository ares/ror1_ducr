class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    if current_user.admin
      @user = User.find(params[:id])
    else
      redirect_to users_path, :alert => 'Neopravneny pristup'
    end
  end

  def update
    if current_user.admin
      @user = User.find(params[:id])
      if @user.update(params_users)
        redirect_to users_path, :notice => 'Uživatel upraven'
      else
        render :edit
      end
    else
      redirect_to users_path, :alert => 'Neopravneny pristup'
    end
  end

  private

  def params_users
    params.require(:user).permit(:admin, :email)
  end
end
