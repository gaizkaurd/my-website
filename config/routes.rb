
Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  mount Lookbook::Engine, at: '/lookbook' if Rails.env.development?

  if Rails.configuration.x.cypress
    namespace :cypress do
      delete 'cleanup', to: 'cleanup#destroy'
    end
  end

  get '/manifest.v1.webmanifest', to: 'statics#manifest', as: :webmanifest
  get '/proyects', to: 'proyects#index', as: :proyect
  get '/proyects/:id', to: 'proyects#show', as: :show_proyect

  root to: 'main#index'


end
