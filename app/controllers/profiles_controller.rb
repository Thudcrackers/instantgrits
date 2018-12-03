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
end
