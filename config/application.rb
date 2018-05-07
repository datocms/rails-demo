require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Sonar
  class Application < Rails::Application
    config.load_defaults 5.2
    config.generators.system_tests = nil
    config.eager_load_paths << Rails.root.join('lib')
    config.autoload_paths << Rails.root.join('lib')

    config.datocms_client = Graphlient::Client.new(
      'https://site-api.datocms.com/graphql',
      headers: {
        "Authorization" => "Bearer #{ENV.fetch('DATO_API_TOKEN')}"
      }
    )
  end
end
