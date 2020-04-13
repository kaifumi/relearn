# 定期的に実行したいバッチ処理をこちらに記述
set :output, File.join(Whenever.path, "log", "cron.log")
# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
set :environment, rails_env
env :PATH, ENV['PATH']
job_type :rbenv_rake, %q!eval "$(rbenv init -)"; cd :path && :environment_variable=:environment bundle exec rake :task --silent :output!

# 1回目の通知タイミングになったらメールを送信する
# 生活リズムも大事なので深夜には送らないように設定
# 10分ごとに送るべきメールがあれば送信する
# every 1.days, :at => ('0'..'23').to_a.collect {|x| ["#{x}:00","#{x}:10","#{x}:20","#{x}:30","#{x}:40","#{x}:50"]}.flatten do
every 10.minutes do
  rake "plan_timing:first_term_mail"
end

# 負荷を分散するために分刻みで送信タイミングを分ける
# 2回目の通知タイミングになったらメールを送信する
# 11分ごとに送るべきメールがあれば送信する
# every 1.days, :at => ('0'..'23').to_a.collect {|x| ["#{x}:01","#{x}:11","#{x}:21","#{x}:31","#{x}:41","#{x}:51"]}.flatten do
every 11.minutes do
  rake "plan_timing:second_term_mail"
end

# 3回目の通知タイミングになったらメールを送信する
# 12分ごとに送るべきメールがあれば送信する
# every 1.days, :at => ('0'..'23').to_a.collect {|x| ["#{x}:02","#{x}:12","#{x}:22","#{x}:32","#{x}:42","#{x}:52"]}.flatten do
every 12.minutes do
  rake "plan_timing:third_term_mail"
end

# 4回目の通知タイミングになったらメールを送信する
# 13分ごとに送るべきメールがあれば送信する
# every 1.days, :at => ('0'..'23').to_a.collect {|x| ["#{x}:03","#{x}:13","#{x}:23","#{x}:33","#{x}:43","#{x}:53"]}.flatten do
every 13.minutes do
  rake "plan_timing:forth_term_mail"
end
