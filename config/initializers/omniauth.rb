Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_APP_ID'], ENV['GOOGLE_APP_SECRET']
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
   end
   