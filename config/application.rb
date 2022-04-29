require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    # Configuration for the application, engines, and railties goes here.
    #config.filter_parameters += [:password, :password_confirmation, :credit_card]
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    config.filter_parameters += [:otp, :password, :session_hash] #Filter out passwords and OTPs from the log (to obfuscate a bit)
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
end
