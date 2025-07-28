# Mai move all these files under derctory 'cli/db_restorers'
require_relative 'fetcher.rb'
require_relative 'select.rb'
require_relative 'restore.rb'

# Mai this is your local machine path, This will not work on the server.
choices = Fetcher.new("/home/manar/moodle-db-backups/*.sql").fetch
choice = Select.new(choices).select

Restore.new("moodle_development",choice).restore

# Mai the file name call 'Start', Stating what?,
# Choose a name like (db_restorers), so we know what the code will do.
