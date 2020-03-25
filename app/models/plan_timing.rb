class PlanTiming < ApplicationRecord
  belongs_to :post
  has_many :notification, dependent: :destroy

  # 分解した月日、時、分を結合
  def self.date_connection(values, post_id)
    # 月日を各dateに代入
    date1 = values[:first_term_date]
    date2 = values[:second_term_date]
    date3 = values[:third_term_date]
    date4 = values[:forth_term_date]

    # dateが空白なら無意味な文字列を持ったハッシュを返す
    return changed_data = { 'hoge': 'hoge' } if values[:first_term_date].empty?
    return changed_data = { 'hoge': 'hoge' } if values[:second_term_date].empty?
    return changed_data = { 'hoge': 'hoge' } if values[:third_term_date].empty?
    return changed_data = { 'hoge': 'hoge' } if values[:forth_term_date].empty?

    # 時間を各hourに代入
    hour1 = values[:first_term_hour]
    hour2 = values[:second_term_hour]
    hour3 = values[:third_term_hour]
    hour4 = values[:forth_term_hour]

    # 分を各minuteに代入
    minute1 = values[:first_term_minute]
    minute2 = values[:second_term_minute]
    minute3 = values[:third_term_minute]
    minute4 = values[:forth_term_minute]

    # 月日、時、分を結合
    connection1 = '2020-' + date1.to_s + " #{hour1}:" + "#{minute1}:00"
    connection2 = '2020-' + date2.to_s + " #{hour2}:" + "#{minute2}:00"
    connection3 = '2020-' + date3.to_s + " #{hour3}:" + "#{minute3}:00"
    connection4 = '2020-' + date4.to_s + " #{hour4}:" + "#{minute4}:00"
    plan_timing = PlanTiming.find_by(post_id: post_id)

    # 変更前の各タームを用意
    term1 = plan_timing[:first_term].strftime('%Y-%m-%d %H:%M:%S')
    term2 = plan_timing[:second_term].strftime('%Y-%m-%d %H:%M:%S')
    term3 = plan_timing[:third_term].strftime('%Y-%m-%d %H:%M:%S')
    term4 = plan_timing[:forth_term].strftime('%Y-%m-%d %H:%M:%S')

    # 空のハッシュを用意
    changed_data = {}

    # 結合した値と変更前の値が違うなら変更データとしてハッシュに挿入
    changed_data.store('first_term', connection1) if connection1 != term1
    changed_data.store('second_term', connection2) if connection2 != term2
    changed_data.store('third_term', connection3) if connection3 != term3
    changed_data.store('forth_term', connection4) if connection4 != term4
    # 変更値が存在するかつ変更可能範囲に入っているならそのまま、違うならハッシュから値を取り除く
    # changed_data['first_term']などは"2020-03-25 07:00:00"のように表示されるが、
    # plan_timing.first_minだけではWed, 25 Mar 2020 10:00:00 JST +09:00のように表示されるため、
    # 不等号での比較に不具合が生じる場合がある。末尾に.strftime('%Y-%m-%d %H:%M:%S')が必要。
    if changed_data['first_term'] && plan_timing.first_min.strftime('%Y-%m-%d %H:%M:%S') <= changed_data['first_term'] && plan_timing.first_max.strftime('%Y-%m-%d %H:%M:%S') >= changed_data['first_term']
    else
      changed_data.delete('first_term')
    end
    # 変更値が存在するかつ変更可能範囲に入っているならそのまま、違うならハッシュから値を取り除く
    if changed_data['second_term'] && plan_timing.second_min.strftime('%Y-%m-%d %H:%M:%S') <= changed_data['second_term'] && plan_timing.second_max.strftime('%Y-%m-%d %H:%M:%S') >= changed_data['second_term']
    else
      changed_data.delete('second_term')
    end
    # 変更値が存在するかつ変更可能範囲に入っているならそのまま、違うならハッシュから値を取り除く
    if changed_data['third_term'] && plan_timing.third_min.strftime('%Y-%m-%d %H:%M:%S') <= changed_data['third_term'] && plan_timing.third_max.strftime('%Y-%m-%d %H:%M:%S') >= changed_data['third_term']
    else
      changed_data.delete('third_term')
    end
    # 変更値が存在するかつ変更可能範囲に入っているならそのまま、違うならハッシュから値を取り除く
    if changed_data['forth_term'] && plan_timing.forth_min.strftime('%Y-%m-%d %H:%M:%S') <= changed_data['forth_term'] && plan_timing.forth_max.strftime('%Y-%m-%d %H:%M:%S') >= changed_data['forth_term']
    else
      changed_data.delete('forth_term')
    end
    # 最後に値を返す
    changed_data
  end
end
