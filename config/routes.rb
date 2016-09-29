Rails.application.routes.draw do
  root 'tasks#index'
  get '/tasks' => 'tasks#index'

  get '/tasks/new' => 'tasks#new', as: 'task_new'
  post '/tasks' => 'tasks#create'

  get '/tasks/:id', to: 'tasks#show', as: 'task'

end
