Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Viewの「root.html.erb」をルートに指定
  root to: 'books#root'
  # REST 複数ルーティングの指定
  resources :books

end
