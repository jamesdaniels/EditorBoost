require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Editorboost
  class Application < Rails::Application
    
    config.autoload_paths = Dir["#{Rails.root}/app/**"]
    
    config.action_view.javascript_expansions[:defaults] = %w(jquery.1.4.1 jquery.ujs)

    config.encoding = "utf-8"

    config.filter_parameters += [:password]

  end
end
