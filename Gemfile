source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 5.2.4', '>= 5.2.4.1'
gem 'sqlite3'
gem 'puma', '~> 3.11'
# railsでSassを使うgem
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # デバッグツール
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # binding.pryを挿入して、処理の経緯を把握できる
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # コーディングスタイルをチェックするための静的解析ツール
  gem 'rubocop', require: false
  # コミット時に自動でrubocopを動作してくれる
  gem 'pre-commit', require: false
  # メールをWEB上で管理
  gem 'letter_opener'
  gem 'letter_opener_web', '~> 1.0 '
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# ログイン機能
gem 'devise'

# 画像ファイルをアップロード
gem "refile", require: "refile/rails", github: 'manfe/refile'
# 画像のリサイズ機能
gem "refile-mini_magick"

# BootstrapでSassを使うgem
gem 'bootstrap-sass', '~> 3.4.1'

# RailsでjQueryを使うためのgem
gem 'jquery-rails'

# 論理削除するためのgem
gem 'paranoia'

#ページネーションするためのgem
gem 'kaminari'

# Railsで定時処理をするためのgem
# バッチスクリプトでしか使わないため、:require => false記載
gem 'whenever', :require => false

# 環境変数を管理するためのgem
gem 'dotenv-rails'

# 言語の翻訳や多言語サポートするためのgem
gem 'rails-i18n'

# カレンダーをRailsで使うためのgem
gem 'fullcalendar-rails'

# カレンダーに時間を入力するためのgem
gem 'momentjs-rails'


