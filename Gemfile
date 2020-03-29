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
gem 'jbuilder', '~> 2.5'
# railsの起動時の処理を最適化するgem
gem 'bootsnap', '>= 1.1.0', require: false

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# ログイン機能
gem 'devise'

# 画像ファイルをアップロード
gem 'refile', require: 'refile/rails', github: 'manfe/refile'
# 画像のリサイズ機能
gem 'refile-mini_magick'

# BootstrapでSassを使うgem
gem 'bootstrap-sass', '~> 3.4.1'

# RailsでjQueryを使うためのgem
gem 'jquery-rails'

# 論理削除するためのgem
gem 'paranoia'

# ページネーションするためのgem
gem 'kaminari'

# bootstrapに合わせたkaminariを使うためのgem
gem 'kaminari-bootstrap', '~> 3.0.1'

# Railsで定時処理をするためのgem
# バッチスクリプトでしか使わないため、:require => false記載
gem 'whenever', require: false

# 環境変数を管理するためのgem
gem 'dotenv-rails'

# 言語の翻訳や多言語サポートするためのgem
gem 'rails-i18n'

# カレンダーをRailsで使うためのgem
gem 'fullcalendar-rails'

# フォームでカレンダーから選べるように導入
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'

# カレンダーに時間を入力するためのgem
gem 'momentjs-rails', '>= 2.9.0'

# トップページでスライドを作るためのgem
gem 'owlcarousel-rails'

group :production do
  # 開発環境では、DBにはSQLiteを利用していたが、AWSで動作させる際にはMySQLを利用
  gem 'mysql2'
end

group :development, :test do
  # デバッグツール
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # binding.pryを挿入して、処理の経緯を把握できる
  gem 'pry-rails'
  # Railsで用いられることが多いテストツールを使うためのgem
  gem 'rspec-rails'
  # テスト用のデータを作成してくれるツール
  gem 'factory_bot_rails'
  # テスト自動化のためのgem
  gem 'guard-rspec'
  # springを使ってrspecを高速化するためのgem
  gem 'spring-commands-rspec'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # コーディングスタイルをチェックするための静的解析ツール
  gem 'rubocop', require: false
  # Railsでrubocopを使うためのgem
  gem 'rubocop-rails'
  # コミット時に自動でrubocopを動作してくれる
  gem 'pre-commit', require: false
  # メールをWEB上で管理
  gem 'letter_opener'
  gem 'letter_opener_web', '~> 1.0 '
end

group :test do
  # フィーチャーテストをRubyでおこなうためのフレームワーク
  gem 'capybara', '>= 2.15'
  # プログラミングを介して、ブラウザを操作するライブラリ
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  # 様々なダミーデータを生成してくれるツール。
  gem 'faker'
  # exampleで行ったDBへの更新、削除を行うためのツール
  gem 'database_cleaner'
  # Rubyで外部アプリケーション（ブラウザの起動)ができるgem
  gem 'launchy'
  # 簡潔かつ直感的にテストをかくためのツール
  gem 'shoulda-matchers'
end
