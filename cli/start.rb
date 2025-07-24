require_relative 'fetcher.rb'
require_relative 'select.rb'
require_relative 'restore.rb'
choices = Fetcher.new("/home/manar/moodle-db-backups/*.sql").call
choice = Select.new(choices).call
Restore.new("moodle_development",choice).call
