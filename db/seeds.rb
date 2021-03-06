User.create!(
  [
    {
      name:"貝野史弥",
      email:"kaifumi1001@gmail.com",
      password:"aaaaaa",
      rank_status: true,
      search_status: true
    }
  ]
)
User.create!(
  [
    {
      name:"遠山の銀さん",
      email:"a1@aa.aa",
      password:"aaaaaa",
      rank_status: true,
      search_status: true
    }
  ]
)
9.times do |n|
  User.create!(
  [
    {
      name: "aa#{n + 1}",
      email: "aa#{n + 1}@aa.aa",
      password: "aaaaa#{n + 1}",
      rank_status: true,
      search_status: true
   }
  ]
)
end
Genre.create!(
  [
    {
      user_id:1,
      type:"Rails"
    },
    {
      user_id:2,
      type:"ruby"
    }
  ]
)
10.times do |n|
  Genre.create!(
  [
    {
      user_id: 1,
      type: "test#{n + 1}"
    }
  ]
)
end
Post.create!(
  [
    {
      user_id:1,
      genre_id:1,
      title:"[Rails]通知機能の実装",
      content:"モデルの作成
                通知メソッドの作成",
      link:"https://qiita.com/yuto_1014/items/2db1dd4fcd7945b980f7",
      created_at:"2020-04-14 21:00:00"
    },
    {
      user_id:1,
      genre_id:2,
      title:"【Ruby】例外処理",
      content:"begin ~ rescue ~ end
      プログラムの処理が期待通りにいかない事はよくあります。Ruby には、エラーが起こった場合に臨時で処理される例外処理といわれるものが用意されています。例外処理という考え方が存在しない言語もあるようですが、その場合は false や nill を返される度にそれに応じた処理を書かなければならないらしいです。Ruby で例外処理は以下のように書きます。",
      link:"https://qiita.com/raindusk/items/6825bcefcad26da3471b",
      created_at:"2020-04-14 22:00:00"
    },
    {
      user_id:1,
      genre_id:1,
      title:"RailsでFullCalendarを使って予定を表示するまで",
      content:"application.jsを弄る",
      link:"https://qiita.com/sasasoni/items/fb0bc1644ece888ae1d4",
      relearn_count: 1,
      created_at:"2020-02-25 03:00:00"
    },
    {
      user_id:1,
      genre_id:1,
      title:"[Rails]通知機能の実装",
      content:"モデルの作成
                通知メソッドの作成",
      link:"https://qiita.com/yuto_1014/items/2db1dd4fcd7945b980f7",
      relearn_count: 2,
      created_at:"2020-02-25 04:00:00"
    },
    {
      user_id:1,
      genre_id:2,
      title:"ruby面白いですの勉強です",
      content:"ruby面白いです面白いです",
      relearn_count: 3,
      link:"http://localhost:3000/posts",
      created_at:"2020-02-25 05:00:00"
    },
    {
      user_id:1,
      genre_id:2,
      title:"ruby面白いですの勉強です",
      content:"ruby面白いです面白いです",
      link:"http://localhost:3000/posts",
      relearn_count: 4,
      created_at:"2020-02-25 06:00:00"
    }

  ]
)
10.times do |n|
  Post.create!(
  [
    {
      user_id: 1,
      genre_id: n + 1,
      title:"test#{n + 1}",
      content:"test#{n + 1}test#{n + 1}test#{n + 1}",
      link:"http://localhost:3000/posts"
    }
  ]
)
end
PlanTiming.create!(
  [
    {
      post_id: 1,
      first_term: "2020-04-14 20:00:00",
      second_term: "2020-04-16 2:00:00",
      third_term: "2020-04-23 20:00:00",
      forth_term: "2020-05-13 20:00:00",
      first_min: "2020-04-13 20:00:00",
      first_max: "2020-04-15 20:00:00",
      second_min: "2020-04-16 21:00:00",
      second_max: "2020-04-19 20:00:00",
      third_min: "2020-04-20 20:00:00",
      third_max: "2020-04-26 20:00:00",
      forth_min: "2020-04-27 20:00:00",
      forth_max: "2020-05-13 20:00:00"
    },
    {
      post_id: 2,
      first_term: "2020-04-14 22:00:00",
      second_term: "2020-04-16 22:00:00",
      third_term: "2020-04-23 22:00:00",
      forth_term: "2020-05-13 22:00:00",
      first_min: "2020-04-13 23:00:00",
      first_max: "2020-04-15 22:00:00",
      second_min: "2020-04-16 22:00:00",
      second_max: "2020-04-19 22:00:00",
      third_min: "2020-04-20 22:00:00",
      third_max: "2020-04-26 22:00:00",
      forth_min: "2020-04-27 22:00:00",
      forth_max: "2020-05-13 22:00:00"
    },
    {
      post_id: 3,
      first_term: "2020-02-26 03:00:00",
      second_term: "2020-02-28 03:00:00",
      third_term: "2020-03-04 03:00:00",
      forth_term: "2020-03-25 03:00:00",
      first_min: "2020-02-25 04:00:00",
      first_max: "2020-02-27 03:00:00",
      second_min: "2020-02-28 03:00:00",
      second_max: "2020-03-01 03:00:00",
      third_min: "2020-03-02 03:00:00",
      third_max: "2020-03-08 03:00:00",
      forth_min: "2020-03-09 03:00:00",
      forth_max: "2020-03-25 03:00:00"
    },
    {
      post_id: 4,
      first_term: "2020-02-26 04:00:00",
      second_term: "2020-02-28 04:00:00",
      third_term: "2020-03-04 04:00:00",
      forth_term: "2020-03-25 04:00:00",
      first_min: "2020-02-25 05:00:00",
      first_max: "2020-02-27 04:00:00",
      second_min: "2020-02-28 04:00:00",
      second_max: "2020-03-01 04:00:00",
      third_min: "2020-03-02 04:00:00",
      third_max: "2020-03-08 04:00:00",
      forth_min: "2020-03-09 04:00:00",
      forth_max: "2020-03-25 04:00:00"
    },
    {
      post_id: 5,
      first_term: "2020-02-26 05:00:00",
      second_term: "2020-02-28 05:00:00",
      third_term: "2020-03-04 05:00:00",
      forth_term: "2020-03-25 05:00:00",
      first_min: "2020-02-25 06:00:00",
      first_max: "2020-02-27 05:00:00",
      second_min: "2020-02-28 05:00:00",
      second_max: "2020-03-01 05:00:00",
      third_min: "2020-03-02 05:00:00",
      third_max: "2020-03-08 05:00:00",
      forth_min: "2020-03-09 05:00:00",
      forth_max: "2020-03-25 05:00:00"
    },
    {
      post_id: 6,
      first_term: "2020-02-26 06:00:00",
      second_term: "2020-02-28 06:00:00",
      third_term: "2020-03-04 06:00:00",
      forth_term: "2020-03-25 06:00:00",
      first_min: "2020-02-25 07:00:00",
      first_max: "2020-02-27 06:00:00",
      second_min: "2020-02-28 06:00:00",
      second_max: "2020-03-01 06:00:00",
      third_min: "2020-03-02 06:00:00",
      third_max: "2020-03-08 06:00:00",
      forth_min: "2020-03-09 06:00:00",
      forth_max: "2020-03-25 06:00:00"
    }
  ]
)
10.times do |n|
  PlanTiming.create!(
  [
    {
      post_id: "#{n + 7}",
      first_term: (Time.now.yesterday+n*100).since(1.day),
      second_term: (Time.now.yesterday+n*100).since(3.day),
      third_term: (Time.now.yesterday+n*100).since(10.day),
      forth_term: (Time.now.yesterday+n*100).since(30.day),
      first_min: (Time.now.yesterday+n*100).since(1.hour),
      first_max: (Time.now.yesterday+n*100).since(2.day),
      second_min: (Time.now.yesterday+n*100).since(3.day),
      second_max: (Time.now.yesterday+n*100).since(7.day),
      third_min: (Time.now.yesterday+n*100).since(8.day),
      third_max: (Time.now.yesterday+n*100).since(14.day),
      forth_min: (Time.now.yesterday+n*100).since(15.day),
      forth_max: (Time.now.yesterday+n*100).since(30.day)
    }
  ]
)
end
RealTiming.create!(
  [
    {
      post_id: 1
    },
    {
      post_id: 2
    },
    {
      post_id: 3,
      first_term: "2020-02-26 21:00:00"
    },
    {
      post_id: 4,
      first_term: "2020-02-26 21:00:00",
      second_term: "2020-02-28 21:00:00"
    },
    {
      post_id: 5,
      first_term: "2020-02-26 21:00:00",
      second_term: "2020-02-28 21:00:00",
      third_term: "2020-03-04 21:00:00"
    },
    {
      post_id: 6,
      first_term: "2020-02-26 21:00:00",
      second_term: "2020-02-28 21:00:00",
      third_term: "2020-03-04 21:00:00",
      forth_term: "2020-03-24 21:00:00"
    }
  ]
)

10.times do |n|
  RealTiming.create!(
  [
    {
      post_id: n + 7
    }
  ]
)
end
RelearnPoint.create!(
  [
    {
      post_id: 1
   },
   {
    post_id: 2
  },
  {
    post_id: 3,
    first_score: 100
  },
  {
    post_id: 4,
    first_score: 100,
    second_score: 200
  },
  {
    post_id: 5,
    first_score: 100,
    second_score: 200,
    third_score: 300
  },
  {
    post_id: 6,
    first_score: 100,
    second_score: 200,
    third_score: 300,
    forth_score: 400
  }
  ]
)
10.times do |n|
  RelearnPoint.create!(
  [
    {
      post_id: n + 7
    }
  ]
)
end
TotalPoint.create!(
  [
    {
        user_id: 1,
        score: 8000
    }
  ]
)
10.times do |n|
  TotalPoint.create!(
  [
    {
      user_id: n + 2,
      score: 1000+n*100
   }
  ]
)
end
Rate.create!(
  [
    {
        user_id: 1,
        total_rate: 19,
        count:20
    }
  ]
)
10.times do |n|
  Rate.create!(
  [
    {
      user_id: n+2,
      total_rate: 0.1+n,
      count: n+1
   }
  ]
)
end
5.times do |n|
  Friend.create!(
  [
    {
      sender_id: 1,
      recipient_id: n+2,
      active_status: true,
      send_request: true
   }
  ]
)
end
5.times do |n|
  Friend.create!(
  [
    {
      sender_id: 2,
      recipient_id: n+3,
      active_status: true,
      send_request: true
   }
  ]
)
end
2.times do |n|
  Friend.create!(
  [
    {
      sender_id: n+7,
      recipient_id: 1,
      active_status: false,
      send_request: true
   }
  ]
)
end

Quote.create!(
  [
    {
      word: "「千里の道も一歩から」老子"
    },
    {
      word: "「努力する人は希望を語り、怠ける人は不満を語る」井上靖"
    },
    {
      word: "「時勢に応じて自分を変革しろ」坂本龍馬"
    },
    {
      word: "「失敗することを恐れるより、何もしないことを恐れろ」本田宗一郎"
    },
    {
      word: "「おもしろきこともなき世をおもしろく」高杉晋作"
    },
    {
      word: "「笑顔は女の子ができる最高のメイクよ」マリリン・モンロー"
    },
    {
      word: "「事実というものは存在しない。存在するのは解釈だけである」ニーチェ"
    },
    {
      word: "「夢は逃げない。逃げるのはいつも自分だ」高橋歩"
    },
    {
      word: "「無いものを嘆くな、あるものを活かせ」松下幸之助"
    },
    {
      word: "「失った物ばかり数えるな」ワンピース"
    },
    {
      word: "「勝つことは偶然じゃない」賭博黙示録カイジ"
    },
    {
      word: "「何が嫌いかより何が好きかで自分を語れよ」ツギハギ漂流作家"
    },
    {
      word: "「諦めたらそこで試合終了だよ」スラムダンク"
    },
    {
      word: "「海を泳いでる最中には 海の広さはわからんよ」バガボンド"
    },
    {
      word: "「俺の敵は だいたい俺です」宇宙兄弟"
    },
    {
      word: "「なんくるないさ」"
    },
    {
      word: "「くすぶるな燃えあがれ」アントン・チェーホフ"
    },
    {
      word: "「まずはやってから考えよう」"
    },
    {
      word: "「火事になるわけでもないなら明日できる掃除を今日やることはない」エルマ・ボンベック"
    },
    {
      word: "「元気があれば何でもできる」アントニオ猪木"
    },
    {
      word: "「必死に生きるか、必死に死ぬか」ショーシャンクの空に"
    },
    {
      word: "「何事も達成するまでは不可能に見える」ネルソン・マンデラ"
    },
    {
      word: "「夢見ることができれば、それは実現できる」ウォルト・ディズニー"
    },
    {
      word: "「速度を上げるばかりが人生ではない」ガンジー"
    },
    {
      word: "「過去にこだわるものは、未来を失ってしまう」ウィンストン・チャーチル"
    },
    {
      word: "「人格者ほど謙遜して自分の力を誇示しない」"
    },
    {
      word: "「一寸の光陰軽んずべからず」"
    },
    {
      word: "「能ある鷹は爪を隠す」"
    },
    {
      word: "「塵も積もれば山となる」"
    },
    {
      word: "「蒔かぬ種は生えぬ」"
    }
  ]
)
