#!/usr/bin/env ruby
require "tty-command"
class Restore
  attr_reader :db, :backup_file
  def initialize(db, backup_file)
    @db = db
    @backup_file = backup_file
  end 

  def restore
    cmd = TTY::Command.new
    cmd.run("dropdb #{db}")
    cmd.run("createdb #{db}")
    cmd.run("psql -d #{db} < #{backup_file}")
  end 
end 

