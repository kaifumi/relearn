Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
   }
  root 'homes#top'
  get '/about' => 'homes#about'
  # ジャンルごとの投稿一覧
  get '/posts/genre/:id' => 'posts#genre_posts_index', as: 'genre_posts_index'
  # 復習完了した投稿一覧、ヘッダーから飛べるようにid無しの設定
  get '/posts/completes' => 'completes#index', as: 'complete_posts'
  patch 'posts/:id/relearn_complete' => 'completes#relearn_complete', as: 'relearn_complete'
  # 全体ポイントランキング表示
  get '/point_rank' => 'ranks#point_rank'
  # 友達ポイントランキング表示
  get '/friend_point_rank' => 'ranks#friend_point_rank'
  # 全体の復習リズムランキング
  get '/rhythm_rank' => 'ranks#rhythm_rank'
  # 友達の復習リズムランキング
  get '/friend_rhythm_rank' => 'ranks#friend_rhythm_rank'
  # 退会確認画面
  get '/sign_out_confirm' => 'users#sign_out_confirmation'
  # 友達検索前の画面
  get 'user/:id/friend_search_before' => 'friends#search_before', as: "friend_search_before"
  # 友達検索後の画面
  get 'user/:id/friend_search' => 'friends#search', as: "friend_search"
  # 友達リクエスト一覧表示
  get 'user/:id/friend_receive' => 'friends#receive', as: "friend_receive"
  # リクエスト送ったときに使う
  post 'user/:id/send_request' => 'friends#send_request', as: "send_request"
  # リクエスト取り消し
  delete 'user/:id/cancel_request' => 'friends#cancel_request', as: "cancel_request"
  resources :users, only: [:edit, :update, :destroy] do
    resources :genres, only: [:index, :create, :update, :destroy]
    resources :notifications, only: [:index, :update]
    resources :friends, only: [:index, :update, :destroy]
  end
  resources :posts do
    # 通知時間はpost_idが必要
    # plan_timingのidは不要のためresourceを使用
    resource :plan_timing, only: [:edit, :update]
    resource :complete, only: [:show, :update, :destroy]
    # 復習ポイントフォームでの入力値受け取り用
    resource :relearn_point, only: [:update]
  end
end
