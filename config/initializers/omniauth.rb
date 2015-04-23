Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET'], scope: "user:email,user:follow,read:org"
    {
      :secure_image_url => 'true',
      :image_size => 'bigger',
    }
end
