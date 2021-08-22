Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	# Cells
	# Users
	# Quests
	# Regions
	# Comments
	# Task

	resources :users, only: [:show] do
		resources :cells, only: [:show, :index, :new] 
	end

	resources :regions, only: [:show, :index] do
		resources :cells, only: [:show, :index]
	end

	resources :cells, :users, :regions, :tasks, :quests, :comments 

	root 'welcome#home'

	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	post '/logout' => 'sessions#destroy'
	get '/signup' => 'users#new'

	# post '/cells/:id/tasks/:task_id' => 'tasks#create'
	post '/tasks/complete' => 'tasks#complete'

	get '/map' => 'cells#map_cell_color'
	get '/map_user_colors' => 'cells#map_user_color'
	get '/map_progress_colors' => 'cells#map_progress_color'
end
