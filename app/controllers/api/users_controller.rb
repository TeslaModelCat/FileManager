class Api::UsersController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def me
    render json: { ok: true, user: current_user }
  end

  def set_notification_settings
    @user = current_user
    if @user.update_attribute(:notification_settings, params[:settings])
      render json: { ok: true, user: @user }
    else
      render json: { ok: false, message: "Settings update failed!" }
    end
  end

  def send_mail_notification
    notification = Notification.create(notification_type: params[:template], user_id: current_user[:id])
    
    if params['sendMail']
      UserMailer.with(user: current_user).send("#{params[:template]}_mail")
    end
    
    render json: { ok: true, notification: notification }
  end
end