class UsersController < ApplicationController
  
  def index
    user = User.all
    render json: user
  end

  def create
    user = User.new(params.require(:user).permit(:name, :email))
    # replace the `user_attributes_here` with the actual attribute keys
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    user.update(params.require(:user).permit(:name, :email))
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    render plain: "user deleted"
  end
  
end
