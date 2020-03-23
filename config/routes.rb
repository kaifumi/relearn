Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get '/about' => 'homes#about'
  # ジャンルごとの投稿一覧
  get '/posts/genre/:id' => 'posts#genre_posts_index', as: 'genre_posts_index'
  # 復習完了した投稿一覧
  get '/posts/completes' => 'completes#index', as: 'complete_posts'
  # 全体ポイントランキング表示
  get '/point_rank' => 'ranks#point_rank'
  # 友達ポイントランキング表示
  get '/friend_point_rank' => 'ranks#friend_point_rank'
  # 全体の復習リズムランキング
  get '/rhythm_rank' => 'ranks#rhythm_rank'
  # 友達の復習リズムランキング
  get '/friend_rhythm_rank' => 'ranks#friend_rhythm_rank'
  resources :users, only: [:edit, :update, :destroy, :destroy_confirm] do
    resources :genres, only: [:index, :create, :update, :detroy]
    resources :notifications, only: [:index, :update]
    resources :friends, only: [:search, :request, :index, :create, :update, :destroy]
  end
  resources :posts do
    # 通知時間はpost_idが必要
    # plan_timingのidは不要のためresourceを使用
    resource :plan_timing, only: [:edit, :update]
    resource :complete, only: [:show, :update, :destroy]
    # 復習ポイントフォームでの入力値受け取り用
    resource :relearn_point, only: [:create, :update]
  end
end
