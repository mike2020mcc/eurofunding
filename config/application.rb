require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Eurofunding
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil

    ENV['RAILS_APP_VERSION'] = File.read(Rails.root + 'REVISION').strip if File.exists?(Rails.root + 'REVISION')

    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      if html_tag =~ /<(input|label|textarea|select)/
        html_field = Nokogiri::HTML::DocumentFragment.parse(html_tag)
        html_field.children.add_class 'is-invalid'
        html_field.to_s.html_safe
      else
        html_tag
      end
    }

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address: 'email-smtp.us-east-1.amazonaws.com',
      port: 587,
      user_name: Rails.application.credentials.ses_user_name,
      password: Rails.application.credentials.ses_password,
      domain: 'financialsolutions.asia',
      authentication: 'login',
      enable_starttls_auto: true
    }

    config.assets.configure do |env|
      env.register_exporter %w(text/css application/javascript image/svg+xml), Sprockets::ExportersPack::BrotliExporter
    end
    
  end
end
