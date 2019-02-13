require_relative 'boot'
require 'rails/all'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bento
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Using sidekiq as background job
    config.active_job.queue_adapter = :sidekiq
    config.to_prepare do
      # Clearance::PasswordsController.layout new_password_path
      # Clearance::SessionsController.layout "my_sessions_layout"
      # Clearance::UsersController.layout "my_admin_layout"
    end
  end
end
