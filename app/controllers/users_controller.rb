class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    begin
      @user = User.find(params[:id])
    rescue
      flash[:danger] = t "users.new.user_not_found"
      redirect_to root_path
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "users.new.create_succes"
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
