Devise.setup do |config|
  config.omniauth :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'], scope: 'email', oauth_callback: "#{ENV['DOMAIN_NAME']}/users/auth/twitter/callback"
  OmniAuth.config.logger = Rails.logger if Rails.env.development? # debug用
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  # ファイルの編集を許可
  config.scoped_views = true
  config.sign_out_via = :delete
end
