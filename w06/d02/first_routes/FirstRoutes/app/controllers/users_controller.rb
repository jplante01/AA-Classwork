class UsersController < ApplicationController
  
  def index
    @users = User.all
    render :index
  end

  def create
    user = User.new(check_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def update
    user = User.find(params[:id])
    if user.update(check_params)
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    render json: user 
  end
  
  private
  def check_params
    params.require(:user).permit(:username)
  end

end
