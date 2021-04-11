Rails.application.routes.draw do
  get 'portforio/top', to: 'portforio#top', as: '/'
  get 'portforio/profiile', to: 'portforio#profile' , as: 'profile'
  get 'portforio/report', to: 'portforio#report' , as: 'report'
  get 'portforio/work', to: 'portforio#work' , as: 'work'
  get 'portforio/contact', to: 'portforio#contact' , as: 'contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
