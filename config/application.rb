require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Assets should be precompiled for production (so we don't need the gems loaded then)
Bundler.require(*Rails.groups(assets: %w(development test)))

module EssenceDiamant
  class Application < Rails::Application
    if Rails.env == "production"
      config.middleware.use("Rack::GoogleAnalytics", :web_property_id => "UA-41322245-1")
    end
  end
end