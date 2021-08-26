Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	# Cells
	# Users
	# Quests
	# Regions
	# Comments
	# Task
	resources :cells, :users, :regions, :tasks, :quests, :comments

	resources :users, only: [:show] do
		resources :cells, only: [:show, :index, :new] 
	end

	resources :regions, only: [:show] do
		resources :cells, only: [:show, :index, :new]
	end

	root 'welcome#home'

	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	post '/logout' => 'sessions#destroy'
	get '/signup' => 'users#new'

	# Task route
	post '/tasks/complete' => 'tasks#complete'

	# Map page routes for different color modes
	get '/map' => 'cells#map_cell_color'
	get '/map_user_colors' => 'cells#map_user_color'
	get '/map_progress_colors' => 'cells#map_progress_color'
	
	# Session route for Discord Oauth 
	get '/auth/discord/callback' => 'sessions#create'

	# Gateway access code page
	post '/gateway' => 'sessions#gateway'

end
