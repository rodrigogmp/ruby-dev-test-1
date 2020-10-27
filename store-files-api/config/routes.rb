Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :directories do
        resources :archives
      end
    end
  end
end
