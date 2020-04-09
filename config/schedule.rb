# 定期的に実行したいバッチ処理をこちらに記述
set :output, File.join(Whenever.path, "log", "cron.log")
set :environment, :production # 環境を設定
env :PATH, ENV['PATH']
job_type :rbenv_rake, %q!eval "$(rbenv init -)"; cd :path && :environment_variable=:environment bundle exec rake :task --silent :output!

# 1回目の通知タイミングになったらメールを送信する
# 生活リズムも大事なので深夜には送らないように設定
# 10分ごとに送るべきメールがあれば送信する
# 6:00~23:50
every 1.days, :at => ('6'..'23').to_a.collect {|x| ["#{x}:00","#{x}:10","#{x}:20","#{x}:30","#{x}:40","#{x}:50"]}.flatten do
# every 1.minutes do
  rake "plan_timing:first_term_mail"
end

# 負荷を分散するために分刻みで送信タイミングを分ける
# 2回目の通知タイミングになったらメールを送信する
# 6:01~23:51
every 1.days, :at => ('6'..'23').to_a.collect {|x| ["#{x}:01","#{x}:11","#{x}:21","#{x}:31","#{x}:41","#{x}:51"]}.flatten do
# every 1.minutes do
  rake "plan_timing:second_term_mail"
end

# 3回目の通知タイミングになったらメールを送信する
# 6:02~23:52
every 1.days, :at => ('6'..'23').to_a.collect {|x| ["#{x}:02","#{x}:12","#{x}:22","#{x}:32","#{x}:42","#{x}:52"]}.flatten do
# every 1.minutes do
  rake "plan_timing:third_term_mail"
end

# 4回目の通知タイミングになったらメールを送信する
# 6:03~23:53
every 1.days, :at => ('6'..'23').to_a.collect {|x| ["#{x}:03","#{x}:13","#{x}:23","#{x}:33","#{x}:43","#{x}:53"]}.flatten do
# every 1.minutes do
  rake "plan_timing:forth_term_mail"
end
