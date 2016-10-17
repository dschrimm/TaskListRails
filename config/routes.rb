Rails.application.routes.draw do

  get "/auth/:provider/callback" =>  "sessions#create"

  # resources :tasks, except: [:create, :new, :edit, :update]
  root 'tasks#index'
  get '/tasks' => 'tasks#index'
  #
  get '/tasks/new' => 'tasks#new', as: 'task_new'
  post '/tasks' => 'tasks#create'
  #
  get '/tasks/:id', to: 'tasks#show', as: 'task'
  #
  get '/tasks/:id/edit' => 'tasks#edit', as: 'task_edit'
  patch '/tasks/:id' => 'tasks#update'
  #
  get '/tasks/:id/completed', to: 'tasks#complete', as: 'task_complete'
  patch '/tasks/:id' => 'tasks#update'
  #
  delete '/tasks/:id' => 'tasks#destroy'

end
