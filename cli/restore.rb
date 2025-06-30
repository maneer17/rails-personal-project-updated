#!/usr/bin/env ruby
require "tty-prompt"
require "tty-command"
prompt = TTY::Prompt.new
cmd = TTY::Command.new
backup_files = Dir.glob("/home/manar/moodle-db-backups/*.sql")
db = "moodle_development"
choices = backup_files.map do |file|
  { name: File.basename(file), value: file }
end
choice = prompt.select("Choose a backup file:", choices)
cmd.run("dropdb #{db}")
cmd.run("createdb #{db}")
cmd.run("psql -d #{db} < #{choice}")
