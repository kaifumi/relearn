require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
# デバイスをrspec内で使えるようにする
require 'devise'
require File.expand_path('spec/support/controller_macros.rb')
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  # FactoryGirlを使うときに記述を減らすことができる
  # config.include FactoryGirl::Syntax::Methods
  config.include FactoryBot::Syntax::Methods
  # springが動かない場合があるので、強制的に再起動させる
  config.before(:all) do
    FactoryBot.reload
  end

  # rspec内でデバイスを使えるようにする
  Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include ControllerMacros, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :request
  include Warden::Test::Helpers
end
