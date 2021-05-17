Rails.application.routes.draw do
 # 投稿機能関連
  get "study_records/index" => "study_records#index"
  get "study_records/new" => "study_records#new"
  post "study_records/create" => "study_records#create"
  get "study_records/months" => "study_records#months"
  get "study_records/:id" => "study_records#show"
  get "study_records/:id/edit" => "study_records#edit"
  patch "study_records/:id/update" => "study_records#update"
  delete "study_records/:id/destroy" => "study_records#destroy"

 # 主要ページ関連
  get "/" => "portforio#top"
  get "/profile" => "portforio#profile"
  get "/report" => "portforio#report"
  get "/work" => "portforio#work"
  get "/contact" => "portforio#contact"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
