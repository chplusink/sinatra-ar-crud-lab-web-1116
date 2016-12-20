require './config/environment'
require './app/controllers/application_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride  # Allows patch and delete Http requests

run ApplicationController
