class Api::NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: { ok: true, notifications: current_user.notifications }
  end

  def update_status
    Notification.where(user_id: current_user[:id], is_read: false).update_all(is_read: true)
  
    render json: { ok: true }
  end
end