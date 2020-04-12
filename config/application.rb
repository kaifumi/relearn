require_relative 'boot'

require "rails/all"

# # Include each railties manually, excluding `active_storage/engine`
# require "active_model/railtie"
# require "active_job/railtie"
# require "active_record/railtie"
# # require "active_storage/engine"
# require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# ENV['TZ'] = 'Asia/Tokyo'

module Relearn
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    # コントローラーに対応するヘルパーのみ呼び出せる
    config.action_controller.include_all_helpers = false
    # パスをタスク作成時のリクエストのたびにロード設定
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    # パスを、rails起動の際にロードする設定
    config.eager_load_paths += Dir["#{config.root}/lib/**/"] 
    # 日本語設定
    config.i18n.default_locale = :ja
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
