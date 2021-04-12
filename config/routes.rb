Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :users do
        get '/:id/posts', to: 'posts#by_user'
      resources :posts
    end
  end
end
