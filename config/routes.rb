Rails.application.routes.draw do
  root 'tasks#index'
  get '/tasks' => 'tasks#index'

  get '/tasks/new' => 'tasks#new', as: 'task_new'
  post '/tasks' => 'tasks#create'

  get '/tasks/:id/delete' => 'tasks#confirm', as: 'task_delete'
  delete '/tasks/:id' => 'tasks#delete'

  get '/tasks/:id/edit' => 'tasks#edit', as: 'task_edit'
  patch '/tasks/:id' => 'tasks#update'

  get '/tasks/:id', to: 'tasks#show', as: 'task'

end
