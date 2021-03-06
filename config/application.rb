require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CaliberRevised
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.exceptions_app = routes

    # Where the I18n library should search for translation files
    # Search nested folders in config/locales for better organization
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]

    # Load all models in nested folders for better organization [ https://medium.com/@dalezak/using-subfolders-in-rails-to-better-organize-models-for-single-table-inheritance-a7b491761b0a ]
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '**/')]

    # Permitted locales available for the application
    config.i18n.available_locales = [:en]

    # Set default locale
    config.i18n.default_locale = :en

    # Use default language as fallback if translation is missing
    config.i18n.fallbacks = true

    # Set :image_processing to use either :mini_magick or :vips (for faster processing, user :vips)
    config.active_storage.variant_processor = :mini_magick
  end
end
