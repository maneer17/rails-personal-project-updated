require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module Moodle
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2
    config.i18n.load_path += Dir[Rails.root.join("locales", "*.{rb,yml}")]


    # Please, add to the `ignore`CCreate a file named .env in the root of your Rails projectreate a file named .env in the root of your Rails project list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])
    config.i18n.available_locales = :en
    config.i18n.default_locale = :en

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    Time.use_zone("Jerusalem") do
      Time.zone.now # Current time in the 'Jerusalem' time zone
    end


    # config.eager_load_paths << Rails.root.join("extras")
  end
end
