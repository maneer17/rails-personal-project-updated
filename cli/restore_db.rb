require 'dotenv/load'
require_relative 'db_restorers/fetcher.rb'
require_relative 'db_restorers/select.rb'
require_relative 'db_restorers/restore.rb'

# Mai this is your local machine path, This will not work on the server.
choices = Fetcher.new(ENV['DB_BACKUPS']).fetch
choice = Select.new(choices).select

Restore.new("moodle_development", choice).restore

# Mai the file name call 'Start', Stating what?,
# Choose a name like (db_restorers), so we know what the code will do.
