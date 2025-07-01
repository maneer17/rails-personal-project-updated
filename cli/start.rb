require_relative 'fetcher.rb'
require_relative 'select.rb'
require_relative 'restore.rb'
choices = Fetcher.new("/home/manar/moodle-db-backups/*.sql").fetch
choice = Select.new(choices).select
Restore.new("moodle_development",choice).restore
