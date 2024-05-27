Rails.application.routes.draw do
  root 'articles#index'
  resources :articles do
    collection do
      get 'search'
    end
    resources :comments, only: [:create, :destroy]
  end
end
