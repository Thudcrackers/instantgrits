class ProfilesController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  before_action :is_user, only: [:edit, :update]
  def show
    @posts = @user.posts.order('created_at DESC')
  end

  def edit

  end
  
  def update
    
    if @user.update(profile_params)
      flash[:success] = 'Your profile has been updated.'
      redirect_to profile_path
    else
      @user.errors.full_messages
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  private
  def set_user
    @user = User.find_by(user_name: params[:user_name])
  end

  def is_user
    unless current_user == @user
      flash[:error] = "That profile doesn't belong to you!"
      redirect_to profile_path
    end
  end

  def profile_params
    params.require(:user).permit(:avatar, :bio)
  end
end
