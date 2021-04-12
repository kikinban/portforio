Rails.application.routes.draw do

  get "/" => "portforio#top"
  get "/profile" => "portforio#profile"
  get "/report" => "portforio#report"
  get "/work" => "portforio#work"
  get "/contact" => "portforio#contact"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
