Rails.application.routes.draw do
  get '/' => "home#top"
  get "/:id" => "home#after"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "exchange" => "home#exchange"
  
end
