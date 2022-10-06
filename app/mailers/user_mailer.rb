class UserMailer < ApplicationMailer
  default from: 'no-reply@email.com'

  def file_removed_mail
    @user = params[:user]

    mail(to: @user.email, subject: 'File removed' )
  end

  def new_notifications_mail
    @user = params[:user]

    mail(to: @user.email, subject: 'New notifications' )
  end

  def upload_start_mail
    @user = params[:user]

    mail(to: @user.email, subject: 'Upload start' )
  end

  def upload_finish_mail
    @user = params[:user]

    mail(to: @user.email, subject: 'Upload finish' )
  end
end
