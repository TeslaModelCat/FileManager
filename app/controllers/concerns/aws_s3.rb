module AWS_S3
  extend ActiveSupport::Concern
  
  class S3
    include Aws

    credentials = Aws::Credentials.new(ENV['AWS_S3_ACCESS_KEY_ID'], ENV['AWS_S3_SECRET_ACCESS_KEY'])
    s3 = Aws::S3::Resource.new(region: ENV['AWS_S3_REGION'], credentials: credentials)

    def self.presign(filename)
      obj = s3.bucket(ENV['AWS_S3_BUCKET']).object(filename)

      {
        presigned_url: obj.presigned_url(:put, {}),
        public_url: obj.public_url
      }
    end

    def self.delete(filename)
      obj = s3.bucket(ENV['AWS_S3_BUCKET']).object(filename)
      obj.delete
    end
  end
end