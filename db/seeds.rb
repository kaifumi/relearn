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
  ]
)
Genre.create!(
  [
    {
      user_id:1,
      type:"プログラミング"
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
    }
  ]
)
PlanTiming.create!(
  [
    {
      post_id: 1,
      first_term: "2020-03-26 09:00:00",
      second_term: "2020-03-28 09:00:00",
      third_term: "2020-04-04 09:00:00",
      forth_term: "2020-04-25 09:00:00",
      first_min: "2020-03-25 10:00:00",
      first_max: "2020-03-27 09:00:00",
      second_min: "2020-03-28 09:00:00",
      second_max: "2020-04-01 09:00:00",
      third_min: "2020-04-02 09:00:00",
      third_max: "2020-04-08 09:00:00",
      forth_min: "2020-04-09 09:00:00",
      forth_max: "2020-04-25 09:00:00"
    },
    {
      post_id: 2,
      first_term: "2020-02-26 09:00:00",
      second_term: "2020-02-28 09:00:00",
      third_term: "2020-03-04 09:00:00",
      forth_term: "2020-03-25 09:00:00",
      first_min: "2020-02-25 10:00:00",
      first_max: "2020-02-27 09:00:00",
      second_min: "2020-02-28 09:00:00",
      second_max: "2020-03-01 09:00:00",
      third_min: "2020-03-02 09:00:00",
      third_max: "2020-03-08 09:00:00",
      forth_min: "2020-03-09 09:00:00",
      forth_max: "2020-03-25 09:00:00"
    },
    {
      post_id: 3,
      first_term: "2020-02-26 09:00:00",
      second_term: "2020-02-28 09:00:00",
      third_term: "2020-03-04 09:00:00",
      forth_term: "2020-03-25 09:00:00",
      first_min: "2020-02-25 10:00:00",
      first_max: "2020-02-27 09:00:00",
      second_min: "2020-02-28 09:00:00",
      second_max: "2020-03-01 09:00:00",
      third_min: "2020-03-02 09:00:00",
      third_max: "2020-03-08 09:00:00",
      forth_min: "2020-03-09 09:00:00",
      forth_max: "2020-03-25 09:00:00"
    },
    {
      post_id: 4,
      first_term: "2020-02-26 09:00:00",
      second_term: "2020-02-28 09:00:00",
      third_term: "2020-03-04 09:00:00",
      forth_term: "2020-03-25 09:00:00",
      first_min: "2020-02-25 10:00:00",
      first_max: "2020-02-27 09:00:00",
      second_min: "2020-02-28 09:00:00",
      second_max: "2020-03-01 09:00:00",
      third_min: "2020-03-02 09:00:00",
      third_max: "2020-03-08 09:00:00",
      forth_min: "2020-03-09 09:00:00",
      forth_max: "2020-03-25 09:00:00"
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
  }
  ]
)