User.create!(
  [
    {
      name:"貝野史弥",
      email:"aaa@aaa",
      password:"aaaaaa"
    },
    {
      name:"板谷優里",
      email:"bbb@bbb",
      password:"bbbbbb"
    },
    {
      name:"藤野貴明",
      email:"ccc@ccc",
      password:"cccccc"
    }
  ]
)
Genre.create!(
  [
    {
      user_id:1,
      type:"プログラミング"
    },
    {
      user_id:2,
      type:"フロントエンド"
  }
  ]
)
Post.create!(
  [
    {
      user_id:1,
      genre_id:1,
      title:"rubyの勉強です",
      content:"rails面白いです",
      link:"http://localhost:3000/posts"
    },
    {
      user_id:1,
      genre_id:1,
      title:"rubyの勉強です",
      content:"rails面白いです",
      link:"http://localhost:3000/posts"
    },
    {
      user_id:1,
      genre_id:1,
      title:"rubyの勉強です",
      content:"rails面白いです",
      link:"http://localhost:3000/posts"
    },
    {
      user_id:1,
      genre_id:1,
      title:"rubyの勉強です",
      content:"rails面白いです",
      link:"http://localhost:3000/posts"
    },
    {
      user_id:2,
      genre_id:2,
      title:"javascriptの勉強です",
      content:"非同期ajax面白いです",
      link:"http://localhost:3000/posts"
    },
    {
      user_id:1,
      genre_id:2,
      title:"javascriptの勉強です",
      content:"非同期ajax面白いです",
      link:"http://localhost:3000/posts"
    }

  ]
)
PlanTiming.create!(
  [
    {
      post_id: 1,
      first_term: "2020-03-26 01:00:00",
      second_term: "2020-03-28 01:00:00",
      third_term: "2020-04-04 0:00:00",
      forth_term: "2020-04-25 01:00:00",
      first_min: "2020-03-25 02:00:00",
      first_max: "2020-03-27 01:00:00",
      second_min: "2020-03-28 01:00:00",
      second_max: "2020-04-01 01:00:00",
      third_min: "2020-04-02 01:00:00",
      third_max: "2020-04-08 01:00:00",
      forth_min: "2020-04-09 01:00:00",
      forth_max: "2020-04-25 01:00:00"
    },
    {
      post_id: 2,
      first_term: "2020-02-26 02:00:00",
      second_term: "2020-02-28 02:00:00",
      third_term: "2020-03-04 02:00:00",
      forth_term: "2020-03-25 02:00:00",
      first_min: "2020-02-25 3:00:00",
      first_max: "2020-02-27 02:00:00",
      second_min: "2020-02-28 02:00:00",
      second_max: "2020-03-01 02:00:00",
      third_min: "2020-03-02 02:00:00",
      third_max: "2020-03-08 02:00:00",
      forth_min: "2020-03-09 02:00:00",
      forth_max: "2020-03-25 02:00:00"
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
      second_term: "2020-02-28 0:00:00",
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
RealTiming.create!(
  [
    {
      post_id: 1
    },
    {
      post_id: 2
    },
    {
      post_id: 3
    },
    {
      post_id: 4
    },
    {
      post_id: 5
    },
    {
      post_id: 6
    }
  ]
)

RelearnPoint.create!(
  [
    {
      post_id: 1
   },
   {
    post_id: 2
  },
  {
    post_id: 3
  },
  {
    post_id: 4
  },
  {
    post_id: 5
  },
  {
    post_id: 6
  }
  ]
)
TotalPoint.create!(
  [
    {
        user_id: 1
    },
    {
      user_id: 2
    },
    {
      user_id: 3
    }
  ]
)
Rate.create!(
  [
    {
        user_id: 1
    },
    {
      user_id: 2
    },
    {
      user_id: 3
    }
  ]
)
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
