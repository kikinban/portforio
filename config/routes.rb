Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  get "/" => "portforio#top"
  get "/profile" => "portforio#profile"
  get "/report" => "portforio#report"
  get "/work" => "portforio#work"
  get "/contact" => "portforio#contact"
  get "/login" => "portforio#login"
  get "mypage", to: "portforio#mypage"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
