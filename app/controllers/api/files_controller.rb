class Api::FilesController < ApplicationController
  before_action :authenticate_user!
  include S3Helper

  def index
    render json: { ok: true, files: current_user.files }
  end

  def get_presigned_url
    res = S3.presign(params[:filename])

    render json: { ok: true, presigned_url: res[:presigned_url] }
  end

  def create
    file = UserFile.create({
      name: params[:name],
      size: params[:size],
      url: "https://#{ENV['AWS_S3_BUCKET']}.s3.#{ENV['AWS_S3_REGION']}.amazonaws.com/#{params[:name]}",
      user_id: current_user[:id]
    })

    render json: { ok: true, file: file }
  end

  def destroy
    file = UserFile.find(params[:id])
    filename = file[:name]
    if file.present?
      file.destroy
      res = S3.delete(filename)
    end

    render json: { ok: true, result: res }
  end
end