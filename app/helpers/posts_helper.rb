module PostsHelper
  # グラフ化するために[時間,記憶率]の配列を返す
  def memory_point_array(post)
    # ヘビロテするので変数化
    # post_timeは投稿作成時の時間
    post_time = post.created_at
    memory_array = []
    # 投稿時刻の前日を記憶率0%として挿入
    memory_array.push([post_time.yesterday, 0])
    # 投稿時刻を記憶率100%として挿入
    memory_array.push([post_time, 100])

    # 復習回数に応じて記憶低減率はゆるやかになるようにわける
    # 復習回数が0回のとき
    if post.relearn_count.zero?
      # diff_timeは作成時と現在の時間の差分(単位は秒)
      diff_time = Time.zone.now - post.created_at
      # 投稿から現在までの0回目の記憶節約率を計算して配列に入れるメソッド
      zero_count_memory(post_time, diff_time, memory_array)

    # 復習回数が1回のとき
    elsif post.relearn_count == 1
      # 復習1回するまでの時間を計算
      diff_first_time = post.real_timings[0][:first_term] - post_time
      # 復習1回目から現在までの時間を計算
      diff_first_to_now = Time.zone.now - post.real_timings[0][:first_term]
      # 投稿から復習1回目までの0回目の記憶節約率使って計算して配列に入れるメソッド
      zero_count_memory(post_time, diff_first_time, memory_array)
      # 復習1回目現在までの記憶節約率を計算して配列に入れるメソッド
      first_count_memory(post_time, diff_first_to_now, memory_array)

    # 復習回数が2回のとき
    elsif post.relearn_count == 2

    # 復習回数が3回のとき
    elsif post.relearn_count == 3

    # 例外処理
    else
      return
    end
    memory_array
  end

  def zero_count_memory(post_time, diff_time, memory_array)
    # 投稿から20分経っていた場合は42%記憶が落ちる
    # 1時間ごとに56％,1日後に74%,1週間後に77%,1ヶ月後に79%忘れる
    # この数値はエビングハウスの忘却曲線に従う。
    # 差分が10分以上ある場合に実行
    # 行数数削減のためメソッド化
    # 第3引数は記憶の下降係数を簡易的に表現したものlost_rateとする
    # 値が増えるほど記憶節約率は高くなる
    # lost_rateはcount1回ごとに0.5増やす予定
    minute_lost_memory(post_time, diff_time, memory_array, 1) if diff_time >= 300
    # 差分が1時間以上ある場合に実行
    hour_lost_memory(post_time, diff_time, memory_array, 1) if diff_time >= 3600
    # 差分が1日以上ある場合に実行
    day_lost_memory(post_time, diff_time, memory_array, 1) if diff_time >= 86_400
    # memory_array
  end

  # 復習1回目現在までの記憶節約率を計算して配列に入れるメソッド
  def first_count_memory(post_time, diff_first_to_now, memory_array)
    # 差分が10分以上ある場合に実行
    minute_lost_memory(post_time, diff_first_to_now, memory_array, 1.5) if diff_first_to_now >= 300
    # 差分が1時間以上ある場合に実行
    hour_lost_memory(post_time, diff_first_to_now, memory_array, 1.5) if diff_first_to_now >= 3600
    # 差分が1日以上ある場合に実行
    day_lost_memory(post_time, diff_first_to_now, memory_array, 1.5) if diff_first_to_now >= 86_400
    # memory_array
  end

  # 投稿から5分以上1時間未満経っていた場合は5分ごとに記憶が落ちるようにするメソッド
  def minute_lost_memory(post_time, diff_time, memory_array, _lost_rate)
    # 差分の時間を5分で割って5分が何回刻みかを出す
    (diff_time / 300).floor.times do |min_num|
      # 頂点が点(1,44)で(20/60,58)を通るので、２次関数を計算するとy=31.5*(x-1)**2+44となる
      memory_array.push([post_time.since(((min_num + 1) * 5).minutes), 31.5 * ((min_num + 1) * 5 / 60 - 1)**2 + 44])
      # 55分以上経っていた場合は処理を終了させる
      break if min_num == 10
    end
    # memory_array
  end

  # 投稿から1時間以上24時間未満経っていた場合は1時間ごとに記憶が落ちるようにするメソッド
  def hour_lost_memory(post_time, diff_time, memory_array, _lost_rate)
    # 差分の時間を1時間で割って時間数を出す
    (diff_time / 3600).floor.times do |hour_num|
      # 頂点が(24,26)で点(1,44)を通るので、２次関数を計算するとy=-0.05671*(x-24)**2+26となる
      memory_array.push([post_time.since(((hour_num + 1)).hours), 0.05671 * ((hour_num + 1) - 24)**2 + 26])
      # 23時間以上経っていた場合は処理を終了させる
      break if hour_num == 22
    end
    # memory_array
  end

  # 投稿から1日以上1ヶ月未満経っていた場合は1日ごとに記憶が落ちるようにするメソッド
  def day_lost_memory(post_time, diff_time, memory_array, _lost_rate)
    # 差分の時間を1日で割って日数を出す
    (diff_time / 86_400).floor.times do |day_num|
      # 頂点が(31,21)で点(1,26)を通るので、２次関数を計算するとy=0.0055555*(x-31)**2+21となる
      memory_array.push([post_time.since(((day_num + 1)).days), 0.0055555 * ((day_num + 1) - 31)**2 + 21])
      # 30日以上経っていた場合は処理を終了させる
      break if day_num == 29
    end
    # memory_array
  end
end
