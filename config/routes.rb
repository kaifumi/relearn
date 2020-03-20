Rails.application.routes.draw do
  root 'homes#top'
  get '/about' => 'homes#about'
  # ジャンルごとの投稿一覧
  get '/posts/genre_index' => 'posts#genre_index', as: 'genre_index_path'
  # 復習完了した投稿一覧
  get '/posts/complete_top' => 'posts#complete_top', as: 'complete_top_path'
  # 復習完了した投稿詳細
  get '/posts/complete_show/:id' => 'posts#complete_show', as: 'complete_show_path'
  # 全体ポイントランキング表示
  get '/point_rank' => 'ranks#point_rank'
  # 友達ポイントランキング表示
  get '/friend_point_rank' => 'ranks#friend_point_rank'
  # 全体の復習リズムランキング
  get '/rhythm_rank' => 'ranks#rhythm_rank'
  # 友達の復習リズムランキング
  get '/friend_rhythm_rank' => 'ranks#friend_rhythm_rank'
  # devise_for :users
  resources :users, only: [:edit, :update, :destroy, :destroy_confirm] do
    resources :genres, only: [:create, :edit, :update, :detroy]
    resources :notifications, only: [:index, :update]
    resources :plan_timings, only: [:edit, :update]
    resources :friends, only: [:search, :request, :index, :create, :update, :destroy]
  end
  resources :posts
  
end
