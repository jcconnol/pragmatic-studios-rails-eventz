Rails.application.routes.draw do

  root "events#index"

  get "events/filter/:filter" => "events#index", as: :filtered_events

  resources :events do # Rails makes all routes for event with one line
    resources :registrations #makes events/id/registrations
    resources :likes
  end

  resources :users
  get "signup" => "users#new"

  resource :session, only: [:create, :new, :destroy]

  # get "events" => "events#index"
  # post "events/new" => "events#create"
  # get "events/:id" => "events#show", as: "event"
  # get "events/:id/edit" => "events#edit", as: "edit_event"
  # patch "events/:id" => "events#update"

end
