require_relative 'boot'

require "rails/all"
Bundler.require(*Rails.groups)

module Relearn
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    # コントローラーに対応するヘルパーのみ呼び出せる
    # パスをタスク作成時のリクエストのたびにロード設定
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    # パスを、rails起動の際にロードする設定
    config.eager_load_paths += Dir["#{config.root}/lib/**/"] 
    # 日本語設定
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
    # testの自動生成をさせない
    config.generators do |g|
      g.test_framework false
    end
  end
end
