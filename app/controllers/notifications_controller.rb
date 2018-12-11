class NotificationsController < ApplicationController
  before_action :set_notification, except: [:index]

  def link_through
    @notification.update read: true
    redirect_to post_path @notification.post
  end

  def index
    
  end

  private
  def set_notification
    @notification = Notification.find(params[:id])
  end
end
