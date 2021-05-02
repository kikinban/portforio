Rails.application.routes.draw do
 # 投稿機能関連
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/months" => "posts#months"
  get "posts/:id" => "posts#show"

 # 主要ページ関連
  get "/" => "portforio#top"
  get "/profile" => "portforio#profile"
  get "/report" => "portforio#report"
  get "/work" => "portforio#work"
  get "/contact" => "portforio#contact"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
