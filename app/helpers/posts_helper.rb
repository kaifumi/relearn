module PostsHelper
  # グラフ化するために[時間,記憶率]の配列を返す
  def memory_point_array(post)
    # post_timeは投稿作成時の時間
    post_time = post.created_at
    memory_array = []
    # 投稿時刻の1分前を記憶率0%として挿入
    memory_array.push([post_time.ago(1.minute), 0])
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
      # 復習時に100%に戻る
      memory_array.push([post.real_timings[0][:first_term], 100])
      # 復習1回目から現在までの記憶節約率を計算して配列に入れるメソッド
      first_count_memory(post.real_timings[0][:first_term], diff_first_to_now, memory_array)

    # 復習回数が2回のとき
    elsif post.relearn_count == 2
      # 復習1回するまでの時間を計算
      diff_first_time = post.real_timings[0][:first_term] - post_time
      # 復習1回目から2回目までの時間を計算
      diff_first_to_second = post.real_timings[0][:second_term] - post.real_timings[0][:first_term]
      # 復習2回目から現在までの時間を計算
      diff_second_to_now = Time.zone.now - post.real_timings[0][:second_term]
      # 投稿から復習1回目までの0回目の記憶節約率使って計算して配列に入れるメソッド
      zero_count_memory(post_time, diff_first_time, memory_array)
      # 復習時に100%に戻る
      memory_array.push([post.real_timings[0][:first_term], 100])
      # 復習1回目から2回目までの記憶節約率を計算して配列に入れるメソッド
      first_count_memory(post.real_timings[0][:first_term], diff_first_to_second, memory_array)
      # 復習時に100%に戻る
      memory_array.push([post.real_timings[0][:second_term], 100])
      # 復習2回目現在までの記憶節約率を計算して配列に入れるメソッド
      second_count_memory(post.real_timings[0][:second_term], diff_second_to_now, memory_array)
    # 復習回数が3回のとき
    elsif post.relearn_count == 3
      # 復習1回するまでの時間を計算
      diff_first_time = post.real_timings[0][:first_term] - post_time
      # 復習1回目から2回目までの時間を計算
      diff_first_to_second = post.real_timings[0][:second_term] - post.real_timings[0][:first_term]
      # 復習2回目から3回目までの時間を計算
      diff_second_to_third = post.real_timings[0][:third_term] - post.real_timings[0][:second_term]
      # 復習3回目から現在までの時間を計算
      diff_third_to_now = Time.zone.now - post.real_timings[0][:third_term]
      # 投稿から復習1回目までの0回目の記憶節約率使って計算して配列に入れるメソッド
      zero_count_memory(post_time, diff_first_time, memory_array)
      # 復習時に100%に戻る
      memory_array.push([post.real_timings[0][:first_term], 100])
      # 復習1回目から2回目までの記憶節約率を計算して配列に入れるメソッド
      first_count_memory(post.real_timings[0][:first_term], diff_first_to_second, memory_array)
      # 復習時に100%に戻る
      memory_array.push([post.real_timings[0][:second_term], 100])
      # 復習2回目から３回目までの記憶節約率を計算して配列に入れるメソッド
      second_count_memory(post.real_timings[0][:second_term], diff_second_to_third, memory_array)
      # 復習時に100%に戻る
      memory_array.push([post.real_timings[0][:third_term], 100])
      # 復習3回目現在までの記憶節約率を計算して配列に入れるメソッド
      third_count_memory(post.real_timings[0][:third_term], diff_third_to_now, memory_array)
    # 復習回数が4回のとき
    elsif post.relearn_count == 4
      # 復習1回するまでの時間を計算
      diff_first_time = post.real_timings[0][:first_term] - post_time
      # 復習1回目から2回目までの時間を計算
      diff_first_to_second = post.real_timings[0][:second_term] - post.real_timings[0][:first_term]
      # 復習2回目から3回目までの時間を計算
      diff_second_to_third = post.real_timings[0][:third_term] - post.real_timings[0][:second_term]
      # 復習3回目から4回目までの時間を計算
      diff_third_to_forth = post.real_timings[0][:forth_term] - post.real_timings[0][:third_term]
      # 復習4回目から現在までの時間を計算
      diff_forth_to_now = Time.zone.now - post.real_timings[0][:forth_term]
      # 投稿から復習1回目までの0回目の記憶節約率使って計算して配列に入れるメソッド
      zero_count_memory(post_time, diff_first_time, memory_array)
      # 復習時に100%に戻る
      memory_array.push([post.real_timings[0][:first_term], 100])
      # 復習1回目から2回目までの記憶節約率を計算して配列に入れるメソッド
      first_count_memory(post.real_timings[0][:first_term], diff_first_to_second, memory_array)
      # 復習時に100%に戻る
      memory_array.push([post.real_timings[0][:second_term], 100])
      # 復習2回目から３回目までの記憶節約率を計算して配列に入れるメソッド
      second_count_memory(post.real_timings[0][:second_term], diff_second_to_third, memory_array)
      # 復習時に100%に戻る
      memory_array.push([post.real_timings[0][:third_term], 100])
      # 復習3回目から４回目までの記憶節約率を計算して配列に入れるメソッド
      third_count_memory(post.real_timings[0][:third_term], diff_third_to_forth, memory_array)
      # 復習時に100%に戻る
      memory_array.push([post.real_timings[0][:forth_term], 100])
      # 復習4回目から現在までの記憶節約率を計算して配列に入れるメソッド
      forth_count_memory(post.real_timings[0][:forth_term], diff_forth_to_now, memory_array)
    # 例外処理
    else
      return
    end
    # 送る値は日付だけにする
    memory_array.map { |k, v| [k.strftime('%m/%d %H:%M'), v] }
  end

  def zero_count_memory(post_time, diff_time, memory_array)
    # 投稿から20分経っていた場合は42%記憶が落ちる
    # 1時間ごとに56％,1日後に74%,1週間後に77%,1ヶ月後に79%忘れる
    # この数値はエビングハウスの忘却曲線に従う。
    # 第3引数は記憶の下降係数lost_rateとする
    # 第4引数は記憶のX軸に追加するadd_xとする
    # 第5引数は記憶のY軸に追加するadd_yとする
    # 頂点が点(1,44)で(20/60,58)を通るので、２次関数を計算するとy=31.5*(x-1)**2+44となる
    minute_lost_memory(post_time, diff_time, memory_array, 31.5, 1, 44) if diff_time > 300
    # 差分が1時間以上ある場合に実行
    # 頂点が(24,26)で点(1,44)を通るので、y=0.034(x-24)2+26 となる
    hour_lost_memory(post_time, diff_time, memory_array, 0.034, 24, 26) if diff_time > 3600
    # 差分が1日以上ある場合に実行
    # 頂点が(31,21)で点(1,26)を通るので、２次関数を計算するとy=0.0055555*(x-31)**2+21となる
    day_lost_memory(post_time, diff_time, memory_array, 0.0055555, 31, 21) if diff_time > 86_400
  end

  # 復習1回目現在までの記憶節約率を計算して配列に入れるメソッド
  def first_count_memory(post_time, diff_first, memory_array)
    # 差分が5分以上ある場合に実行
    # 頂点が(3,68)
    # 節約率が56%/Hが24%/Hに変わったため、2.33333倍の軽減率とする
    # 頂点が(1,76)で(1/3,82)を通るので、２次関数を計算するとy=13.5*(x-1)**2+76となる
    minute_lost_memory(post_time, diff_first, memory_array, 13.5, 1, 76) if diff_first > 300
    # 差分が1時間以上ある場合に実行
    # 頂点が(3,68)で点(1,100)を通るので、２次関数を計算するとy=0.014584*(x-24)**2+68.285となる
    hour_lost_memory(post_time, diff_first, memory_array, 0.014584, 24, 68.285) if diff_first > 3600
    # 差分が1日以上ある場合に実行
    # 頂点が(30,66.142)で点(1/24,76)を通るので、２次関数を計算するとy=0.01098*(x-31)**2+66.142となる
    day_lost_memory(post_time, diff_first, memory_array, 0.00238, 31, 66.142) if diff_first > 86_400
  end

  # 復習2回目現在までの記憶節約率を計算して配列に入れるメソッド
  def second_count_memory(post_time, diff_second, memory_array)
    # 差分が5分以上ある場合に実行
    # 頂点が(1,89.9366)で点(1/3,92.452)を通るので、２次関数を計算するとy=5.6597*(x-1)**2+89.9366となる
    minute_lost_memory(post_time, diff_second, memory_array, 5.6597, 1, 89.9366) if diff_second > 300
    # 差分が1時間以上ある場合に実行
    # 頂点が（24,86.7)で点(1,89.9366)を通るので、２次関数を計算するとy=0.006118*(x-24)**2+86.7となる
    hour_lost_memory(post_time, diff_second, memory_array, 0.006118, 24, 86.7) if diff_second > 3600
    # 差分が1日以上ある場合に実行
    # 頂点が(31,85.8)で点(1/24,89.9366)を通るので、２次関数を計算するとy=0.001*(x-31)**2+85.8となる
    day_lost_memory(post_time, diff_second, memory_array, 0.001, 31, 85.8) if diff_second > 86_400
  end

  # 復習3回目現在までの記憶節約率を計算して配列に入れるメソッド
  def third_count_memory(post_time, diff_third, memory_array)
    # 差分が5分以上ある場合に実行
    # 頂点が(1,95.1)で点(1/3,96.325)を通るので、２次関数を計算するとy=2.7563*(x-1)**2+95.1となる
    minute_lost_memory(post_time, diff_third, memory_array, 2.7563, 1, 95.1) if diff_third > 300
    # 差分が1時間以上ある場合に実行
    # 頂点が(24,93.525)で点（1,95.1）を通るので、２次関数を計算するとy=0.002977*(x-20)**2+88となる
    hour_lost_memory(post_time, diff_third, memory_array, 0.002977, 24, 93.525) if diff_third > 3600
    # 差分が1日以上ある場合に実行
    # 頂点が(31,93.0866)で点(1/24,95.1)を通るので、２次関数を計算するとy=0.0004871*(x-31)**2+93.0866となる
    day_lost_memory(post_time, diff_third, memory_array, 0.0004871, 31, 93.0866) if diff_third > 86_400
  end

  def forth_count_memory(post_time, diff_forth, memory_array)
    # 差分が5分以上ある場合に実行
    # 頂点が(1,97.729)で点(1/3,98.297)を通るので、２次関数を計算するとy=1.278*(x-1)**2+97.729となる
    minute_lost_memory(post_time, diff_forth, memory_array, 1.278, 1, 97.729) if diff_forth > 300
    # 差分が1時間以上ある場合に実行
    # 頂点が(24,97)で点（1,97.729）を通るので、２次関数を計算するとy=0.001378*(x-24)**2+97となる
    hour_lost_memory(post_time, diff_forth, memory_array, 0.001378, 24, 97) if diff_forth > 3600
    # 差分が1日以上ある場合に実行
    # 頂点が(31,96.796)で点(1,97)を通るので、２次関数を計算するとy=0.00022666*(x-31)**2+96.796となる
    day_lost_memory(post_time, diff_forth, memory_array, 0.00022666, 31, 96.796) if diff_forth > 86_400
  end

  # 投稿から5分より長く1時間以下経っていた場合は5分ごとに記憶が落ちるようにするメソッド
  # 引数は左から投稿時間、時間間隔、記憶節約率配列、記憶低減係数、X軸への追加点、Y軸への追加点
  def minute_lost_memory(post_time, diff_time, memory_array, lost_rate, add_x, add_y)
    # 差分の時間を5分で割って5分が何回刻みかを出す
    (diff_time / 300).floor.times do |min_num|
      memory_array.push([post_time.since(((min_num + 1) * 5).minutes),
                         lost_rate * ((min_num + 1) * 5 * 0.016666 - add_x)**2 + add_y])
      # 55分以上経っていた場合は処理を終了させる
      break if min_num == 11
    end
  end

  # 投稿から1時間より長く24時間以下経っていた場合は1時間ごとに記憶が落ちるようにするメソッド
  def hour_lost_memory(post_time, diff_time, memory_array, lost_rate, add_x, add_y)
    # 差分の時間を1時間で割って時間数を出す
    (diff_time / 3600).floor.times do |hour_num|
      memory_array.push([post_time.since(((hour_num + 1)).hours),
                         lost_rate * ((hour_num + 2) - add_x)**2 + add_y])
      # 23時間以上経っていた場合は処理を終了させる
      break if hour_num == 22
    end
  end

  # 投稿から1日より長く1ヶ月以下経っていた場合は1日ごとに記憶が落ちるようにするメソッド
  def day_lost_memory(post_time, diff_time, memory_array, lost_rate, add_x, add_y)
    # 差分の時間を1日で割って日数を出す
    (diff_time / 86_400).floor.times do |day_num|
      memory_array.push([post_time.since(((day_num + 1)).days),
                         lost_rate * ((day_num + 2) - add_x)**2 + add_y])
      # 30日以上経っていた場合は処理を終了させる
      break if day_num == 29
    end
  end
end
