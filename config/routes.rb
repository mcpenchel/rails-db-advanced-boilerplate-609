Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users
  
  authenticate :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "blazer"
  end
  
  root to: 'pages#home'
end
