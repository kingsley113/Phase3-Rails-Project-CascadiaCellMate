# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

task :routes do
	require 'rails/commands/routes/routes_command'
	Rails.application.require_environment!
	cmd = Rails::Command::RoutesCommand.new
	cmd.perform
end