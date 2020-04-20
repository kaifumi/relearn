Rails.application.routes.draw do
  # WEB上でメールを確認できる。必要なときのみコメントアウトを外す。
  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env == 'development'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    # このpathを通して外部API認証が行われる。
    :omniauth_callbacks => 'users/omniauth_callbacks'
   }
  root 'homes#top'
  get '/about' => 'homes#about'
  # ジャンルごとの投稿一覧
  get '/posts/genre/:user_id/:id' => 'posts#genre_posts_index', as: 'genre_posts_index'
  # 復習完了した投稿一覧、ユーザーの区別をするためid有りにする
  get '/posts/completes/:user_id' => 'completes#index', as: 'complete_posts'
  # 復習回数が4回未満で復習完了する場合
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
  # 通知を全削除
  delete 'user/:id/notification' => 'notifications#destroy_all', as: "destroy_all_notifications"
  resources :users, only: [:edit, :update, :destroy] do
    resources :genres, only: [:index, :create, :update, :destroy]
    resources :notifications, only: [:index]
    resources :friends, only: [:index, :update, :destroy]
    # current_userと友達の投稿を区別する必要があるためネストする
    resources :posts do
      # 通知時間はpost_idが必要
      # plan_timingのidは不要のためresourceを使用
      resource :plan_timing, only: [:edit, :update]
      resource :complete, only: [:show, :update, :destroy]
      # 復習ポイントフォームでの入力値受け取り用
      resource :relearn_point, only: [:update]
    end
  end
end
